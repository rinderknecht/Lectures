module Initial = struct

  open Eval.Initial

  let calc ast =
    try
      print_int (eval ast); print_newline(); exit 0
    with DivByZero ->
           print_endline "Error: division by zero."; exit 1
end

module WithLet = struct

  open Eval.WithLet

  let calc ast =
    try
      print_int (eval empty_env ast); print_newline(); exit 0
    with Err DivByZero ->
           print_endline "Error: division by zero."; exit 1
       | Err (FreeVar x) ->
           print_endline ("Error: free variable " ^ x); exit 1
end

module WithCondInt = struct

  open Eval.WithCondInt

  let calc ast =
    try
      print_int (eval empty_env ast); print_newline(); exit 0
    with Err DivByZero ->
           print_endline "Error: division by zero."; exit 1
       | Err (FreeVar x) ->
           print_endline ("Error: free variable " ^ x); exit 1
end

module WithCond = struct

  open Eval.WithCond

  let calc ast =
    try
      print_int (eval empty_env ast); print_newline(); exit 0
    with Err DivByZero ->
           print_endline "Error: division by zero."; exit 1
       | Err (FreeVar x) ->
           print_endline ("Error: free variable " ^ x); exit 1
end

module WithEnvList = struct

  open Eval.WithEnvList

  let calc ast =
    try
      print_int (eval [] ast); print_newline(); exit 0
    with Err DivByZero ->
           print_endline "Error: division by zero."; exit 1
       | Err (FreeVar x) ->
           print_endline ("Error: free variable " ^ x); exit 1
end

let main () =
  let () =
    print_endline "Saisissez une expression + RET + CTRL-D:";
    flush stdout in
  let lexbuf = Lexing.from_channel stdin in
  let ast = Parser.expression Lexer.token lexbuf in
  let () = print_string "=> "
in WithEnvList.calc (ast)


let _ = Printexc.print main ()
