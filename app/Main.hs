module Main where

import Actions.OsResolverAction (resolveOS)

main :: IO ()
main = do
  resolveOS
