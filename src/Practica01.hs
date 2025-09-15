module Practica01 where

--FUNCIONES
valorAbs :: Int -> Int
valorAbs x = if x >= 0 then x else -x
-- Colocar el numero con parentesis al momento de ejecutar

esDivisor :: Int -> Int -> Bool
esDivisor x y = if y `mod` x == 0 then True else False

cuadratica :: Float -> Float -> Float -> Float -> Float
cuadratica a b c v = a**v^2 + b**v + c
-- "**" es para hacer potencia usando float

sumaFracciones :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumaFracciones (x,y) (a,b) = if y == b then (x + a, y) else (x*b + y*a, y*b)

comparador :: Float -> Float -> Int
comparador n m = if n == m then 0 else (if n > m then 1 else -1)

puntoMedio :: (Float, Float) -> (Float, Float) -> (Float, Float)
puntoMedio (x,y) (a,b) = ((x + a)/2, (y+b)/2) 

--RELACIONES
type Rel a b = [(a, b)]

-- Funciones definidas para las relaciones
divici :: Int -> Int -> Bool
divici x y = if (x + y) `mod` 5 == 0 then True else False

-- Relaciones de los ejercicios
relacionDivisor :: Rel Int Int
relacionDivisor = [(x,y) | x <- [1..30], y <- [1..30], x `mod` 2 == y `mod` 2, esDivisor x y]

relacionSumaEspecial :: Rel Int Int
relacionSumaEspecial = [(x,y) | x <- [1..30], y <- [1..30], divici x y, x < y]

relacionCongruentesModuloN :: Int -> Rel Int Int
relacionCongruentesModuloN n = [(x,y) | x <- [1..30], y <- [1..30], x /= y, x `mod` n == y `mod` n]

--NATURALES
-- Cero es natural, Suc Cero es natural, Suc Suc Cero es natural, etc.
data Natural = Cero | Suc Natural deriving (Show,Eq) --Esto es para que se muestre y que se puedan comparar

esPar :: Natural -> Bool
esPar Cero = True
esPar (Suc Cero) = False
esPar (Suc(Suc n)) = esPar n

iguales :: Natural -> Natural -> Bool
iguales Cero Cero = True
iguales Cero (Suc x) = False
iguales (Suc x) Cero = False
iguales (Suc x) (Suc y) = iguales x y

maximo :: Natural -> Natural -> Natural 
maximo Cero Cero = Cero
maximo Cero (Suc x) = (Suc x)
maximo (Suc x) Cero = (Suc x)
maximo (Suc x) (Suc y) = Suc (maximo x y)

potencia :: Natural -> Natural -> Natural
potencia Cero (Suc x) = Cero
potencia (Suc x) Cero = (Suc Cero)
potencia  x (Suc y) = multiplicacion x (potencia x y)

-- Funciones necesarias para poder definir a la potencia
suma :: Natural -> Natural -> Natural
suma Cero Cero = Cero
suma Cero (Suc x) = (Suc x)
suma (Suc x) Cero = (Suc x)
suma (Suc x) y = Suc (suma x y)

multiplicacion :: Natural -> Natural -> Natural
multiplicacion Cero Cero = Cero
multiplicacion Cero (Suc x) = Cero
multiplicacion (Suc x) Cero = Cero
multiplicacion (Suc x) y = suma y (multiplicacion x y) 

