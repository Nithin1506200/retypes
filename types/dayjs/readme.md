# dayjs rescript types

## how to install

- step 1: install package
  `yarn add -D @retypes/dayjs`
- step 2: add dependencies in bsconfig.json

```json
{
  "bs-dependencies": ["@retypes/dayjs"]
}
```

- step 3: build with deps to build the dependency once
  `npm rescript build -with-deps`

# usage

```ts
let x = Dayjs.dayJs("dfs")
let il: Dayjs.T.iLocale = Dayjs.T.iLocale(~name="nithin", ())
let m = x.unsafe_locale(. ~preset="sfs", ~object=il)
```
