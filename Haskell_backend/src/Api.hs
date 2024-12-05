{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Api where
import User
import Web.Scotty
import Data.Aeson (object, (.=), FromJSON, ToJSON)
import Database.Selda.SQLite
import Data.Text
import GHC.Generics (Generic)
--import Control.Monad.IO.Class

data NewUser = NewUser
    {
        user :: Text,
        user_description :: Text
    }deriving (Show, Generic)

instance FromJSON NewUser
instance ToJSON NewUser





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
    get "/" $ do
        users <- liftIO $ withSQLite "user.db" dbSelectUser
        let jsonUsers = object ["users" .= users]
        json jsonUsers

    get "/login" $ text "Login"

    get "/api/login" $ text "Api Login"

    get "/api/succes" $ text "Api Succès"


