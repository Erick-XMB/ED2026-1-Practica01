module Practica01 where

--FUNCIONES
---- Ejercicio No 1 ----
valorAbs :: Int -> Int
valorAbs x = if x >= 0 then x else -x
-- Colocar el numero con parentesis al momento de ejecutar

---- Ejercicio No 2 ----
esDivisor :: Int -> Int -> Bool
esDivisor x y = if y `mod` x == 0 then True else False

---- Ejercicio No 3 ----
cuadratica :: Float -> Float -> Float -> Float -> Float
cuadratica a b c v = (a * (v*v)) + (b*v) + c 

---- Ejercicio No 4 ----
sumaFracciones :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumaFracciones (x,y) (a,b) = if y == b then (x + a, y) else (x*b + y*a, y*b)
-- Colocar ambos numeros con parentesis. Ejemplo: "(x,y) (a,b)" --

---- Ejercicio No 5 ----
comparador :: Float -> Float -> Int
comparador n m = if n == m then 0 else (if n > m then 1 else -1)

---- Ejercicio No 6 ----
puntoMedio :: (Float, Float) -> (Float, Float) -> (Float, Float)
puntoMedio (x,y) (a,b) = ((x + a)/2, (y+b)/2) 
-- Colocar ambos numeros con parentesis. Ejemplo: "(x,y) (a,b)" --


--RELACIONES
type Rel a b = [(a, b)]

--- Función auxiliar para el ejercicio 2 ----
--- Se uso para definir que la suma de nos numeros es divisor de 5 ---
divici :: Int -> Int -> Bool
divici x y = if (x + y) `mod` 5 == 0 then True else False

---- Ejercicio No 1 ----
relacionDivisor :: Rel Int Int
relacionDivisor = [(x,y) | x <- [1..30], y <- [1..30], x `mod` 2 == y `mod` 2, esDivisor x y]

---- Ejercicio No 2 ----
relacionSumaEspecial :: Rel Int Int
relacionSumaEspecial = [(x,y) | x <- [1..30], y <- [1..30], divici x y, x < y]

---- Ejercicio No 3 ----
relacionCongruentesModuloN :: Int -> Rel Int Int
relacionCongruentesModuloN n = [(x,y) | x <- [1..30], y <- [1..30], x /= y, x `mod` n == y `mod` n]
-- Colocar el número "n" que desee en la terminal --


--NATURALES
-- Cero es natural, Suc Cero es natural, Suc Suc Cero es natural, etc.
data Natural = Cero | Suc Natural deriving (Show,Eq) --Esto es para que se muestre y que se puedan comparar

---- Ejercicio No 1 ----
esPar :: Natural -> Bool
esPar Cero = True
esPar (Suc Cero) = False
esPar (Suc(Suc n)) = esPar n

---- Ejercicio No 2 ----
iguales :: Natural -> Natural -> Bool
iguales Cero Cero = True
iguales Cero (Suc x) = False
iguales (Suc x) Cero = False
iguales (Suc x) (Suc y) = iguales x y

---- Ejercicio No 3 ----
maximo :: Natural -> Natural -> Natural 
maximo Cero Cero = Cero
maximo Cero (Suc x) = (Suc x)
maximo (Suc x) Cero = (Suc x)
maximo (Suc x) (Suc y) = Suc (maximo x y)

---- Ejercicio No 4 ----
potencia :: Natural -> Natural -> Natural
potencia Cero (Suc x) = Cero
potencia (Suc x) Cero = (Suc Cero)
potencia  x (Suc y) = multiplicacion x (potencia x y)

---- Funciones auxiliares para poder realizar el ejercicio No 4 ----
---- Función de suma ----
suma :: Natural -> Natural -> Natural
suma Cero Cero = Cero
suma Cero (Suc x) = (Suc x)
suma (Suc x) Cero = (Suc x)
suma (Suc x) y = Suc (suma x y)

---- Función de multiplicación ----
multiplicacion :: Natural -> Natural -> Natural
multiplicacion Cero Cero = Cero
multiplicacion Cero (Suc x) = Cero
multiplicacion (Suc x) Cero = Cero
multiplicacion (Suc x) y = suma y (multiplicacion x y) 

