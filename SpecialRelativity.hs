{- #############################################
        SpecialRelativity.hs
        Salman Hossain, September 2016.
############################################## -}

module SpecialRelativity where

c :: Float                -- Speed of light constant
c = 299792458

ctometer :: Float -> Float            -- Converts in terms of c to meters.
ctometer x = x * c

metertoc :: Float -> Float        -- Converts meters into ratio of c.
metertoc x = x / c

gamma :: Float -> Float                   -- Calculates the gamma taking the speed as a ratio of c.
gamma v = 1 / (sqrt (1 - ((v ^ 2) / 1)))

ctogamma :: Float -> Float                -- Calculates the gamma taking the speed as terms of meters per second.
ctogamma v = (gamma (metertoc v))

xlorentz :: Float -> Float -> Float -> Float          -- Does a lorentz transformation for the space.
xlorentz speed x t = (gamma speed) * (x - (speed * t))

tlorentz :: Float -> Float -> Float -> Float           -- Does a Lorentz tranformation for the time.
tlorentz speed x t = (gamma speed) * (t - (speed * x))

vlorentz :: Float -> Float -> Float      -- Does a Lorentz transformation for Velocity (GENERAL)
vlorentz v w = (v - w) / (1 - (v * w))

lorentz :: Float -> Float -> Float -> String                                                         -- Does a lorentz tranformation for both space and time.
lorentz speed x t = "x'=" ++ (show (xlorentz speed x t)) ++ "   t'=" ++ (show (tlorentz speed x t))

timedialation :: Float -> Float -> Float       -- Calculates the time dialation based on speed in terms of c and the time.
timedialation v t = ((gamma v) * t)

lengthcontraction :: Float -> Float -> Float         -- Calculates the length contraction based on the speed in terms of c and the length.
lengthcontraction v h = (h / (gamma v))

timeinterval :: Float -> Float -> Float
timeinterval t1 t2 = t2 - t1

spaceinterval :: Float -> Float -> Float
spaceinterval x1 x2 = x2 - x1

spacetimeinterval :: Float -> Float -> Float         -- Calculates the space time interval. c = 1
spacetimeinterval x t = (sqrt ((t ^ 2) - (x ^ 2)))

spacetimeinterval2 :: Float -> Float -> Float -> Float -> Float
spacetimeinterval2 t1 t2 x1 x2 = (sqrt ((timeinterval t1 t2) ^ 2) - ((spaceinterval x1 x2) ^ 2))
