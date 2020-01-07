module Actions.OsResolverAction
    (
      resolveOS
    ) where

import System.Process
import System.IO


currentSystemText :: String
currentSystemText = "Current running operating system: "

resolveOS :: IO ()
resolveOS = do
  (_, Just hout, _, _) <- createProcess (proc "date" []){ std_out = CreatePipe }
  dateOut <- hGetContents hout
  putStrLn ("Current date/time is: " ++ dateOut)