type continent = [
  | @as("na") #NorthAmerica
  | @as("sa") #SouthAmerica
  | @as("af") #Africa
  | @as("eu") #Europe
  | @as("as") #Asia
  | @as("oc") #Oceania
]

let continentFromString = continentString => {
  switch continentString {
  | "na" => Some(#NorthAmerica)
  | "sa" => Some(#SouthAmerica)
  | "af" => Some(#Africa)
  | "eu" => Some(#Europe)
  | "as" => Some(#Asia)
  | "oc" => Some(#Oceania)
  | _ => None
  }
}

let continentToString = continent => {
  switch continent {
  | #NorthAmerica => "na"
  | #SouthAmerica => "sa"
  | #Africa => "af"
  | #Europe => "eu"
  | #Asia => "as"
  | #Oceania => "oc"
  }
}

let continentToFullName = continent => {
  switch continent {
  | #NorthAmerica => "North America"
  | #SouthAmerica => "South America"
  | #Africa => "Africa"
  | #Europe => "Europe"
  | #Asia => "Asia"
  | #Oceania => "Oceania"
  }
}
