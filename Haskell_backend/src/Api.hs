{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Api where
import Bdd
import User
import Web.Scotty
import Data.Aeson (object, (.=), FromJSON, ToJSON)
import Database.Selda.SQLite
import Data.Text
import GHC.Generics (Generic)

-- Définition des routes API
--apiRoutes :: ScottyM ()
--apiRoutes = do
--    -- Route pour obtenir un message JSON
--    get "/api/getUsers" $ do
--        users <- liftIO $ withSQLite "twitter.db" dbSelectUsers
--        let jsonUsers = object ["users" .= users]
--        json jsonUsers
--    post "/api/submitNewUser" $ do
--        userData <- jsonData :: ActionM NewUser
--        liftIO $ print userData

apiRoutes :: ScottyM()
apiRoutes = do
    post "/api/submit_user" $ do
        userData <- jsonData :: ActionM NewUser
        user userData