module Main where

import System.Exit (exitFailure)

import qualified Data.Text as Text
import Data.Typeable
import Data.Unjson
import Control.Applicative

-- As an example we will use a hypothetical configuration data.
-- There are some mandatory fields and some optional fields.
data Konfig =
     Konfig { konfigHostname :: Text.Text
            , konfigPort     :: Int
            , konfigUsername :: Maybe Text.Text
            }
  deriving (Eq,Ord,Show,Typeable)

instance Unjson Konfig where
  unjson = pure Konfig
           <*> field "hostname"
           <*> field "port"
           <*> fieldOpt "username"

main = do
    putStrLn "This test always fails!"
    exitFailure
