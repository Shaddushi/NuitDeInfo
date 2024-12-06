{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import User
import Web.Scotty
import Control.Monad.IO.Class (liftIO)
import Control.Monad (when)
import Network.Wai.Middleware.Cors (simpleCors)
import Database.Selda
import Database.Selda.Backend (runSeldaT)
import Database.Selda.SQLite (sqliteOpen)
import System.Directory (doesFileExist) 
import Data.Aeson (ToJSON, FromJSON)
import GHC.Generics (Generic)


data ResponseStatus = ResponseStatus { status :: Bool }
    deriving (Show, Generic)
instance ToJSON ResponseStatus

main :: IO ()
main = do
    dbExists <- doesFileExist "user.db"
    conn <- sqliteOpen "user.db"
    when (not dbExists) $ do
        runSeldaT dbInit conn
    scotty 8080 $ do
        middleware simpleCors
        get "/api/login" $ do
            newUser <- jsonData :: ActionM NewUser
            liftIO $ print newUser
            users <- liftIO $ runSeldaT (dbSelectUserOnly newUser) conn
            if null users  
                then do
                    liftIO $ runSeldaT (dbAddUser newUser) conn  
                    redirect "/api/login/valide"
                else do
                    usersmdp <- liftIO $ runSeldaT (dbSelectUsersWithPassword newUser) conn
                    redirect (if null usersmdp 
                        then "/api/login/invalide" 
                        else "/api/login/valide")
        post "/api/login/invalide" $ do
            json $ ResponseStatus False

        post "/api/login/valide" $ do
            json $ ResponseStatus True