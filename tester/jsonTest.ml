open Yojson.Basic

type env =
  { currentCoinbase : string
  ; currentDifficulty : string
  ; currentGasLimit : string
  ; currentNumber : string
  ; currentTimestamp : string
  }

let parse_env (j : json) : env =
  Util.(
    { currentCoinbase = to_string (member "currentCoinbase" j)
    ; currentDifficulty = to_string (member "currentDifficulty" j)
    ; currentGasLimit = to_string (member "currentGasLimit" j)
    ; currentNumber = to_string (member "currentNumber" j)
    ; currentTimestamp = to_string (member "currentTimestamp" j)
    })

type exec =
  { address : string
  ; caller : string
  ; code : string
  ; data : string
  ; gas : string
  ; gasPrice : string
  ; origin : string
  ; value : string
  }

let parse_exec (j : json) : exec =
  Util.(
    { address = to_string (member "address" j)
    ; caller = to_string (member "caller" j)
    ; code = to_string (member "code" j)
    ; data = to_string (member "data" j)
    ; gas = to_string (member "gas" j)
    ; gasPrice = to_string (member "gasPrice" j)
    ; origin = to_string (member "origin" j)
    ; value = to_string (member "value" j)
    })

type test_case =
  { callcreates : json list
  ; env : env
  ; exec : exec
  ; gas : string
  ; logs : json list
  ; out : string
  ; post : (string * json) list
  ; pre : (string * json) list
  }

let parse_test_case (j : json) : test_case =
  Util.(
  { callcreates = to_list (member "callcreates" j)
  ; env = parse_env (member "env" j)
  ; exec = parse_exec (member "exec" j)
  ; gas = to_string (member "gas" j)
  ; logs = to_list (member "logs" j)
  ; out = to_string (member "out" j)
  ; post = to_assoc (member "post" j)
  ; pre = to_assoc (member "pre" j)
  })

let () =
  let vm_arithmetic_test : json = Yojson.Basic.from_file "../tests/VMTests/vmArithmeticTest.json" in
  let vm_arithmetic_test_assoc : (string * json) list = Util.to_assoc vm_arithmetic_test in
  let () =
    List.iter (fun (label, elm) ->
        let () = Printf.printf "%s\n" label in
        let case : test_case = parse_test_case elm in
        ()
      ) vm_arithmetic_test_assoc
  in
  ()