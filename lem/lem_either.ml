(*Generated by Lem from either.lem.*)
 

open Lem_bool
open Lem_basic_classes
open Lem_list
open Lem_tuple
open Either

(*type either 'a 'b
  = Left  of 'a
  | Right of 'b*)


(* -------------------------------------------------------------------------- *)
(* Equality.                                                                  *)
(* -------------------------------------------------------------------------- *)

(*val eitherEqual : forall 'a 'b. Eq 'a, Eq 'b => (either 'a 'b) -> (either 'a 'b) -> bool*)
(*val eitherEqualBy : forall 'a 'b. ('a -> 'a -> bool) -> ('b -> 'b -> bool) -> (either 'a 'b) -> (either 'a 'b) -> bool*)

(*let eitherEqualBy eql eqr (left: either 'a 'b) (right: either 'a 'b):bool= 
  match (left, right) with
    | (Left l, Left l') -> eql l l'
    | (Right r, Right r') -> eqr r r'
    | _ -> false
  end*)
(*let eitherEqual:either 'a 'b ->either 'a 'b ->bool=  eitherEqualBy  
  dict_Basic_classes_Eq_a.isEqual_method  dict_Basic_classes_Eq_b.isEqual_method*)

let instance_Basic_classes_Eq_Either_either_dict dict_Basic_classes_Eq_a dict_Basic_classes_Eq_b:(('a,'b)Either.either)eq_class= ({

  isEqual_method = (Either.eitherEqualBy  
  dict_Basic_classes_Eq_a.isEqual_method  dict_Basic_classes_Eq_b.isEqual_method);

  isInequal_method = (fun x y->not ((Either.eitherEqualBy  
  dict_Basic_classes_Eq_a.isEqual_method  dict_Basic_classes_Eq_b.isEqual_method x y)))})

let either_setElemCompare cmpa cmpb x y:int=  
 ((match (x, y) with
    | (Either.Left x', Either.Left y') -> cmpa x' y'
    | (Either.Right x', Either.Right y') -> cmpb x' y'
    | (Either.Left _, Either.Right _) -> (-1)
    | (Either.Right _, Either.Left _) -> 1
  ))

let instance_Basic_classes_SetType_Either_either_dict dict_Basic_classes_SetType_a dict_Basic_classes_SetType_b:(('a,'b)Either.either)setType_class= ({

  setElemCompare_method = (fun x y->either_setElemCompare  
  dict_Basic_classes_SetType_a.setElemCompare_method  dict_Basic_classes_SetType_b.setElemCompare_method x y)})
                           

(* -------------------------------------------------------------------------- *)
(* Utility functions.                                                         *)
(* -------------------------------------------------------------------------- *)

(*val isLeft : forall 'a 'b. either 'a 'b -> bool*)

(*val isRight : forall 'a 'b. either 'a 'b -> bool*)


(*val either : forall 'a 'b 'c. ('a -> 'c) -> ('b -> 'c) -> either 'a 'b -> 'c*)
(*let either fa fb x:'c=  match x with
  | Left a -> fa a
  | Right b -> fb b
end*)


(*val partitionEither : forall 'a 'b. list (either 'a 'b) -> (list 'a * list 'b)*)
(*let rec partitionEither l:list 'a*list 'b=  match l with
  | [] -> ([], [])
  | x :: xs -> begin
      let (ll, rl) = partitionEither xs in
      match x with 
        | Left l -> (l::ll, rl)
        | Right r -> (ll, r::rl)
      end
    end
end*)


(*val lefts : forall 'a 'b. list (either 'a 'b) -> list 'a*)


(*val rights : forall 'a 'b. list (either 'a 'b) -> list 'b*)


