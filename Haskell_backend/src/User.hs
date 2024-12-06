{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE TypeOperators #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

module User where

import Data.Aeson (object, (.=), FromJSON, ToJSON, toJSON)
import Database.Selda
import Database.Selda.SQLite
import Data.Text (pack)

import Control.Monad.IO.Class (liftIO)


instance ToJSON (ID a) where
  toJSON = toJSON . pack . show . fromId


data User = User
  { user_id :: ID User
  , user_pseudo :: Text
  , user_mdp :: Text
  } deriving (Generic, Show)

instance SqlRow User
instance ToJSON User

user_table :: Table User
user_table = table "User" [#user_id :- autoPrimary,
                           #user_pseudo :- unique]


data Success = Success
    { success_id :: ID Success
    , success_nom :: Text
    , success_description :: Text
    , success_type :: Text
    , related_id :: Int
    , success_key :: Text
} deriving (Generic, Show)

instance SqlRow Success
instance ToJSON Success

success_table :: Table Success
success_table = table "Success" [#success_id :- primary
                                ,#success_key :- unique]

data User_Success = User_Success
    { id_user_success :: ID User_Success
    , id_user :: ID User
    , id_success :: ID Success
} deriving (Generic, Show)

instance SqlRow User_Success
instance ToJSON User_Success

user_success_table :: Table User_Success
user_success_table = table "User_Success" [ #id_user_success :- autoPrimary
                            , #id_user :- foreignKey user_table #user_id
                            , #id_success :- foreignKey success_table #success_id]


data NewUser = NewUser
    {
        user :: Text,
        user_password :: Text
    }deriving (Show, Generic)

instance FromJSON NewUser
instance ToJSON NewUser



dbSelectUser :: SeldaT SQLite IO[(User)]
dbSelectUser = query $ do
    select user_table

dbSelectSuccess :: SeldaT SQLite IO[(Success)]
dbSelectSuccess = query $ do
    select success_table

dbSelectUser_Success :: SeldaT SQLite IO[(User_Success)]
dbSelectUser_Success = query $ do
    select user_success_table

dbSelectUserOnly ::NewUser -> SeldaT SQLite IO[(User)]
dbSelectUserOnly (NewUser userPseudo userMdp) = query $ do
    u <- select user_table
    restrict ( u ! #user_pseudo .== literal userPseudo)
    return (u)

dbSelectUsersWithPassword :: NewUser-> SeldaT SQLite IO[(User)]
dbSelectUsersWithPassword (NewUser userPseudo userMdp) = query $ do
    u <-  select user_table
    restrict (u ! #user_pseudo .== literal userPseudo)
    restrict (u ! #user_mdp .== literal userMdp)
    return u

dbAddUser :: NewUser -> SeldaT SQLite IO()
dbAddUser (NewUser x y) = do
    tryInsert user_table
       [
        User def  x y
       ]>>= liftIO . print


dbInit :: SeldaT SQLite IO ()
dbInit = do
    createTable user_table
    tryInsert user_table
       [
        User def  "ValentinLeMeilleur" "coeur",
        User def  "HonoreLeConnard" "Moche"
        ] >>= liftIO . print

    createTable success_table
    tryInsert success_table
        [
        Success def "Honore est mort" "Vous avez tue Honore" "Humain" 3 "key_jcp",
        Success def "Poasson est mort" "Vous avez tue le poasson" "Poisson" 6 "key_jcp2"
        ] >>= liftIO . print

