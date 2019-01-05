{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE TypeOperators     #-}

module Lib
  ( hello
  , run
  ) where

import           Data.Monoid      ((<>))
import           Data.Text        (Text)

import           GraphQL
import           GraphQL.API
import           GraphQL.Resolver (Handler)

type Hello = Object "Hello" '[] '[ Argument "who" Text :> Field "greeting" Text]

hello :: Handler IO Hello
hello = pure (\who -> pure ("Hello " <> who))

run :: Text -> IO Response
run = interpretAnonymousQuery @Hello hello
