{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE TypeOperators #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

module User where

import Data.Aeson (ToJSON,toJSON)
import Database.Selda
import Database.Selda.SQLite
import Data.Text (pack)

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
user_table = table "User" [#user_id :- autoPrimary]


data Success = Success
    { success_id :: ID Success
    , success_nom :: Text
    , success_description :: Text
    , success_type :: Text
    , related_id :: Integer
} deriving (Generic, Show)

instance SqlRow Success
instance ToJSON Success

success_table :: Table Success
success_table = table "Success" [#success_id :- autoPrimary]

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


dbSelectUser :: SeldaT SQLite IO[User]
dbSelectUser = query $ do
    select user_table

dbSelectSuccess :: SeldaT SQLite IO[Success]
dbSelectSuccess = query $ do
    select success_table

dbSelectUser_Success :: SeldaT SQLite IO[User_Success]
dbSelectUser_Success = query $ do
    select user_success_table


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
        Success def "Honore est mort" "Vous avez tue Honore" "Humain" 3,
        Success def "Poasson est mort" "Vous avez tue le poasson" "Poisson" 6
        ] >>= liftIO . print

