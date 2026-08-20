open Ast


module Initial = struct
  type value = int

  exception DivByZero

  let rec eval e = match e with
    Const n -> n
  | BinOp (op,e1,e2) ->
      let v1 = eval e1 and v2 = eval e2
      in begin match op with
           Add -> v1 + v2 | Sub -> v1 - v2 | Mult -> v1 * v2
         | Div -> if v2 = 0 then raise DivByZero else v1/v2
         end
  | _ -> failwith "Construction non traitée"
end

module WithLet = struct
  type value = int

  type environnement = string -> value

  let empty_env = fun x -> raise Not_found

  let extend env (x,v) = fun y -> if x = y then v else env y

  type error =
    DivByZero
  | FreeVar of string

  exception Err of error

  let rec eval env e = match e with
    Const n -> n
  | BinOp (op,e1,e2) ->
      let v1 = eval env e1 and v2 = eval env e2
      in begin match op with
           Add -> v1 + v2 | Sub -> v1 - v2 | Mult -> v1 * v2
         | Div -> if v2 = 0 then raise (Err DivByZero) else v1/v2
         end
  | Var x -> begin try env x with
               Not_found -> raise (Err (FreeVar x))
             end
  | Let (x,e1,e2) ->
      let v1 = eval env e1 in eval (extend env (x,v1)) e2
  | _ -> failwith "Construction non traitée"
end

module WithCondInt = struct
  type value = int
  type environnement = string -> value

  let empty_env = fun x -> raise Not_found
  let extend env (x,v) = fun y -> if x = y then v else env (y)

  type error =
    DivByZero
  | FreeVar of string

  exception Err of error


  let rec eval env e = match e with
    Const n -> n
  | BinOp (op,e1,e2) ->
      let v1 = eval env e1 and v2 = eval env e2
      in begin match op with
           Add -> v1 + v2 | Sub -> v1 - v2 | Mult -> v1 * v2
         | Div -> if v2 = 0 then raise (Err DivByZero) else v1/v2
         end
  | Var x -> begin try env x with
               Not_found -> raise (Err (FreeVar x))
             end
  | Let (x,e1,e2) ->
      let v1 = eval env e1 in eval (extend env (x,v1)) e2
  | Ifz (e1,e2,e3) ->
      if eval env e1 = 0 then eval env e3 else eval env e2
  | _ -> failwith "Construction non traitée"
end

module WithCond = struct
  type value = int
  type environnement = string -> value

  let empty_env = fun x -> raise Not_found
  let extend env (x,v) = fun y -> if x = y then v else env y

  type error =
    DivByZero
  | FreeVar of string

  exception Err of error

  let rec eval_bool b = match b with
    True -> true
  | False -> false
  | And (b1,b2) -> (eval_bool b1) && (eval_bool b2)
  | Or (b1,b2) -> (eval_bool b1) || (eval_bool b2)
  | Not b -> not (eval_bool b)

  let rec eval env e = match e with
    Const n -> n
  | BinOp (op,e1,e2) ->
      let v1 = eval env e1 and v2 = eval env e2
      in begin match op with
           Add -> v1 + v2 | Sub -> v1 - v2 | Mult -> v1 * v2
         | Div -> if v2 = 0 then raise (Err DivByZero) else v1/v2
         end
  | Var x -> begin try env x with
               Not_found -> raise (Err (FreeVar x))
             end
  | Let (x,e1,e2) ->
      let v1 = eval env e1 in eval (extend env (x,v1)) e2
  | Ifz (e1,e2,e3) ->
      if eval env e1 = 0 then eval env e3 else eval env e2
  | If (b,e1,e2) ->
      if eval_bool b then eval env e1 else eval env e2
  | _ -> failwith "Construction non traitée"
end

module WithEnvList = struct
  type value = int

  type environnement = (string * value) list

  type error =
    DivByZero
  | FreeVar of string

  exception Err of error

  let lookup x env =
    try List.assoc x env with
      Not_found -> raise (Err (FreeVar x))

  let rec eval_bool b = match b with
    True -> true
  | False -> false
  | And (b1,b2) -> (eval_bool b1) && (eval_bool b2)
  | Or (b1,b2) -> (eval_bool b1) || (eval_bool b2)
  | Not b -> not (eval_bool b)

  let rec eval env e = match e with
    Const n -> n
  | BinOp (op,e1,e2) ->
      let v1 = eval env e1 and v2 = eval env e2
      in begin match op with
           Add -> v1 + v2 | Sub -> v1 - v2 | Mult -> v1 * v2
         | Div -> if v2 = 0 then raise (Err DivByZero) else v1/v2
         end
  | Ifz (e1,e2,e3) ->
      if eval env e1 = 0 then eval env e3 else eval env e2
  | If (b,e1,e2) ->
      if eval_bool b then eval env e1 else eval env e2
  | Var x -> lookup x env
  | Let (s,e1,e2) -> let v1 = eval env e1 in eval ((s,v1)::env) e2
  | _ -> failwith "Construction non traitée"
end
