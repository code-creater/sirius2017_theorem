module LawerHL.Type where

import Lawer.Type 
import Lawer.Context
import Lawer.Reduce
import Lawer.Pretty ()

data Record = Record 
            { recName :: Name
            , recParams :: Context Term
            , recConstructors :: Context Term }
            deriving(Show)


data Inductive  = Inductive 
                { indName :: Name
                , indParams :: Context Term
                , indConstructors :: Context Term }
                deriving(Show)

data TypeApp = TVar Name 
             | TApp TypeApp TypeApp
             deriving(Show, Eq)

data Algebraic = Algebraic 
               { algName :: Name
               , algParams :: [Name]
               , algConstructors :: Context [TypeApp]}
               deriving(Show)

data Construction   = Ind Inductive 
                    | Alg Algebraic 
                    | Rec Record
                    deriving(Show)