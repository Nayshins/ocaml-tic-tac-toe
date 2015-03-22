open Core.Std

let set_nth of_list index element =
  let array_of_list = Array.of_list of_list in
  Array.set array_of_list index element;
  Array.to_list array_of_list

