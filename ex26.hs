-- implement the following functions using only these combinators from the SKI combinator calculus:
s :: (a -> b -> c) -> (a -> b) -> a -> c 
s x y z = x z (y z)

k :: a -> b -> a 
k x y = x

i :: a -> a 
i x = x

-- example :
f :: a -> b -> b
f = k i
-- f = K I
-- f x y = K I x y = I y = y

-- 1. (.)
(.) :: (b->c) -> (a->b) -> (a->c)
-- (.) f g x = f (g x)
-- f (g x) = (s (k s) k) f g x
(.) = s (k s) k
-- (.) = S (K S) K

-- 2. (&)
(&) :: a -> (a -> b) -> b
-- x & g = g x
-- (&) x g = g x
-- g x = g k (i x) g
-- g x = g (k k) x (i x) g
-- g x = i g (((s (k k) i) x) g)
-- g x = g (s (k k) i x g)
-- g x = s i ((s (k k) i) x) g
-- g x = s (k (s i)) (s (k k) i) x g
-- (&) x = s (k (s i)) (s (k k) i) x (&)
-- (&) = s (k (s i)) (s (k k) i)  
-- from s (k k) i = k
-- (&) = s (k (s i)) k
(&) = s (k (s i)) k
-- (&) = S (K (S I)) K

-- 3. flip
flip :: (a -> b -> c) -> b -> a -> c
-- flip g x y = g y x
-- g y x = s g (k x) y
-- flip g x y = s g (k x) y
-- flip g x  = s g (k x) 
flip g x  = s g (k x) 
