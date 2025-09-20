module Practica01 where

--FUNCIONES
---- Ejercicio No 1 (Calculo del valor absoluto de un numero entero) ----
valorAbs :: Int -> Int
valorAbs x = if x >= 0 then x else -x
-- Colocar el numero con parentesis al momento de ejecutar

---- Ejercicio No 2 (Dado dos numeros enteros, se devuelve true si el primero es divisor del segundo) ----
esDivisor :: Int -> Int -> Bool
esDivisor x y = if y `mod` x == 0 then True else False

---- Ejercicio No 3 (La funcion recibe 4 parametros a,b,c,v para calcular la ecuacion ax² + bx + c en v) ----
cuadratica :: Float -> Float -> Float -> Float -> Float
cuadratica a b c v = (a * (v*v)) + (b*v) + c 

---- Ejercicio No 4 (Resultado de sumar fracciones que recibe como parametros haciendo diferencia si tiene mismo denominador o no) ----
sumaFracciones :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumaFracciones (x,y) (a,b) = if y == b then (x + a, y) else (x*b + y*a, y*b)
-- Colocar ambos numeros con parentesis. Ejemplo: "(x,y) (a,b)" --

---- Ejercicio No 5 (Recibe dos numeros n y m en donde se devuelve 0 si n = m, 1 si n > m, -1 si m > n) ----
comparador :: Float -> Float -> Int
comparador n m = if n == m then 0 else (if n > m then 1 else -1)

---- Ejercicio No 6 (Devuelve el punto medio entre dos puntos del plano cartesiano) ----
puntoMedio :: (Float, Float) -> (Float, Float) -> (Float, Float)
puntoMedio (x,y) (a,b) = ((x + a)/2, (y+b)/2) 
-- Colocar ambos numeros con parentesis. Ejemplo: "(x,y) (a,b)" --


--RELACIONES
type Rel a b = [(a, b)]

--- Función auxiliar para el ejercicio 2 ----
--- Se uso para definir que la suma de nos numeros es divisor de 5 ---
divici :: Int -> Int -> Bool
divici x y = if (x + y) `mod` 5 == 0 then True else False

---- Ejercicio No 1 (Relacion en donde a y b tienen la misma paridad y a es divisor de b) ----
relacionDivisor :: Rel Int Int
relacionDivisor = [(x,y) | x <- [1..30], y <- [1..30], x `mod` 2 == y `mod` 2, esDivisor x y]

---- Ejercicio No 2 (Relacion en donde a + b es multiplo de 5 y a < b) ----
relacionSumaEspecial :: Rel Int Int
relacionSumaEspecial = [(x,y) | x <- [1..30], y <- [1..30], divici x y, x < y]

---- Ejercicio No 3 (Relacion en donde se debe recibir un entero n y tenemos que aRb si a %n = b %n con a ̸= b.) ----
relacionCongruentesModuloN :: Int -> Rel Int Int
relacionCongruentesModuloN n = [(x,y) | x <- [1..30], y <- [1..30], x /= y, x `mod` n == y `mod` n]
-- Colocar el número "n" que desee en la terminal --


--NATURALES
-- Cero es natural, Suc Cero es natural, Suc Suc Cero es natural, etc.
data Natural = Cero | Suc Natural deriving (Show,Eq) --Esto es para que se muestre y que se puedan comparar

---- Ejercicio No 1 (Determina si es par o impar un numero natural) ----
esPar :: Natural -> Bool
esPar Cero = True
esPar (Suc Cero) = False
esPar (Suc(Suc n)) = esPar n

---- Ejercicio No 2 (Determina si dos numeros naturales son iguales o no) ----
iguales :: Natural -> Natural -> Bool
iguales Cero Cero = True
iguales Cero (Suc x) = False
iguales (Suc x) Cero = False
iguales (Suc x) (Suc y) = iguales x y

---- Ejercicio No 3 (Devuelve el mayor de dos numeros naturales) ----
maximo :: Natural -> Natural -> Natural 
maximo Cero Cero = Cero
maximo Cero (Suc x) = (Suc x)
maximo (Suc x) Cero = (Suc x)
maximo (Suc x) (Suc y) = Suc (maximo x y)

---- Ejercicio No 4 (Se tiene dos numeros naturales n y m, y se devuelve n^m) ----
potencia :: Natural -> Natural -> Natural
potencia Cero (Suc x) = Cero
potencia (Suc x) Cero = (Suc Cero)
potencia  x (Suc y) = multiplicacion x (potencia x y)

---- Funciones auxiliares para poder realizar el ejercicio No 4 ----
---- Función de suma de numeros naturales ----
suma :: Natural -> Natural -> Natural
suma Cero Cero = Cero
suma Cero (Suc x) = (Suc x)
suma (Suc x) Cero = (Suc x)
suma (Suc x) y = Suc (suma x y)

---- Función de multiplicación de numeros naturales ----
multiplicacion :: Natural -> Natural -> Natural
multiplicacion Cero Cero = Cero
multiplicacion Cero (Suc x) = Cero
multiplicacion (Suc x) Cero = Cero
multiplicacion (Suc x) y = suma y (multiplicacion x y) 

