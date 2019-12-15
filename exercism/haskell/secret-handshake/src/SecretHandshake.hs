module SecretHandshake (handshake) where

import Data.String (IsString)

signs :: [String]
signs = ["wink", "double blink", "close your eyes", "jump"]

handshake :: IsString a => a -> [String]
handshake n = undefined

-- class SecretHandshake
--   attr_reader :commands
-- 
-- 
--   def initialize(n)
--     n = n.to_i
--     @commands = Signs.select.with_index{|s, i| (n >> i).odd? }
--     @commands.reverse! if (n >> 4).odd?
--   end
-- end
