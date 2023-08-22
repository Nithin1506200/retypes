//
module T = {
  type dayjs
  type unitTypeShort = [#d | #D | #M | #m | #y | #h | #s | #ms]
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
  type unitType = [unitTypeShort | unitTypeLong | unitTypeLongPlural]
  type configType

  type opUnitType = [unitType | #week | #weeks | #w]
  type manipulateType = [opUnitType]
  type qUnitType = [unitType | #quarter | #quarters | #Q]

  type ordinal
  type relativeTime = {
    "future": string,
    "past": string,
    "s": string,
    "m": string,
    "mm": string,
    "h": string,
    "hh": string,
    "d": string,
    "dd": string,
    "y": string,
    "yy": string,
    "M": string,
    "MM": string,
  }
  @deriving(abstract)
  type formats = {
    @optional
    "LT": string,
    @optional
    "LTS": string,
    @optional
    "L": string,
    @optional
    "LL": string,
    @optional
    "LLL": string,
    @optional
    "LLLL": string,
  }
  /**
  this is abstract
  @example : 
  let x=Dayjs.T.iLocale(~name="nithin",())
  */
  @deriving(abstract)
  type iLocale = {
    name: string,
    @optional weekdays?: array<string>,
    @optional months?: array<string>,
    @optional weekStart?: array<string>,
    @optional monthShort?: array<string>,
    @optional weekdaysMin?: array<string>,
    @optional @as("ordinal") unsafe_ordinal?: (~n: int) => ordinal,
    @optional formats?: formats,
    @optional relativeTime?: relativeTime,
  }

  type rec dayJs = {
    clone: (. unit) => dayJs,
    isValid: (. unit) => bool,
    //   year: (. unit) => int,
    year: (. int) => dayJs,
    //   month: (. number) => dayjs,
    month: (. unit) => int,
    //   date: (. int) => dayJs,
    date: (. unit) => int,
    //   day: (. int) => dayJs,
    day: (. unit) => int,
    //    hour: (. unit) => int,
    hour: (. unit) => int,
    //   minute: (. unit) => int,
    minute: (. unit) => int,
    //   second: (. unit) => int,
    second: (. unit) => int,
    //   millisecond: (. unit) => int,
    millisecond: (. unit) => int,
    set: (. ~unit: unitType, ~value: int) => dayJs,
    get: (. ~unit: unitType) => int,
    add: (. ~value: int, ~unit: manipulateType=?) => dayJs,
    subtract: (. ~value: int, ~unit: manipulateType=?) => dayJs,
    startOf: (. ~unit: opUnitType) => dayJs,
    endOf: (. ~unit: opUnitType) => dayJs,
    format: (. ~template: string=?) => string,
    diff: (. ~date: configType=?, ~unit: [qUnitType | opUnitType]=?, ~float: bool=?) => int,
    valueOf: (. unit) => int,
    unix: (. unit) => int,
    daysInMonth: (. unit) => int,
    toDate: (. unit) => string,
    toJSON: (. unit) => string,
    toISOString: (. unit) => string,
    toString: (. unit) => string,
    utcOffset: (. unit) => int,
    isBefore: (. ~date: configType=?, ~unit: opUnitType=?) => bool,
    isSame: (. ~date: configType=?, ~unit: opUnitType=?) => bool,
    isAfter: (. ~date: configType=?, ~unit: opUnitType=?) => bool,
    @as("locale") unsafe_locale: (. ~preset: string, ~object: iLocale) => dayJs,
  }
}
module Utils = {
  type rec configTypeEnum =
    | String(string)
    | Number(int)
    | Date(Js.Date.t)
    | DayJs(T.dayjs)
    | Null
    | Undefined
  external convertToConfigType: 'a => T.configType = "%identity"
  let configTypeBuilder: configTypeEnum => T.configType = x => {
    switch x {
    | String(s) => convertToConfigType(s)
    | Number(i) => convertToConfigType(i)
    | Date(d) => convertToConfigType(d)
    | DayJs(d) => convertToConfigType(d)
    | Null => convertToConfigType(Js.null)
    | Undefined => convertToConfigType(Js.undefined)
    }
  }
}
@module("dayjs") @val external dayJs: T.configType => T.dayJs = "dayjs"
@module("dayjs") @val external isDayjs: (. unit) => bool = "isDayjs"
@module("dayjs") @val external unix: int => T.dayJs = "unix"
