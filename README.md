# Contacts app

## Port

`18500`

## Initialization 

```shell
rails new contacts --no-rc --database postgresql --javascript importmap \
  --css tailwind --skip-test --skip-system-test \
  --skip-solid --skip-cache
```

I followed [this guide](https://inertia-rails.dev/guide/server-side-setup) to setup Inertia Rails (for when we just have to have React 🤷🏾‍♂️).
