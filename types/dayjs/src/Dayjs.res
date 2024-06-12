type unitTypeShort = [#d | #D | #M | #y | #h | #m | #s | #ms]

type unitTypeLong = [#millisecond | #second | #minute | #hour | #day | #month | #year | #date]

type unitTypeLongPlural = [
  | #milliseconds
  | #seconds
  | #minutes
  | #hours
  | #days
  | #months
  | #years
  | #dates
]
type customParseFormat
type unitType = [unitTypeLong | unitTypeLongPlural | unitTypeShort]
type rec t = {
  clone: unit => t,
  isValid: unit => bool,
  set: (~unit: unitType, ~value: int) => t,
  get: (~unit: unitType) => int,
  add: (~value: int, ~unit: unitType) => t,
  subtract: (~value: int, ~unit: unitType) => t,
  format: string => string,
  diff: (~date: t, ~unit: unitType) => int,
  isBefore: (~date: t, ~unit: unitType=?) => bool,
  isAfter: (~date: t, ~unit: unitType=?) => bool,
  toISOString: unit => string,
  extend: customParseFormat => unit,
}
@module("dayjs")
external make: string => t = "default"

@module("dayjs") external extend: customParseFormat => unit = "extend"
// custom parser

@module("dayjs/plugin/customParseFormat") @val
external customParseFormat: customParseFormat = "default"

@module("dayjs")
external makeWithCustomFormat: (string, ~format: string, ~strict: bool) => t = "default"
@module("dayjs")
external makeWithCustomFormats: (string, ~format: array<string>, ~strict: bool) => t = "default"
