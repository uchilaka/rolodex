# Scaffolding

To teardown a scaffold, run `bin/rails destroy scaffold <scaffold_name>`

## Regions

```bash
bin/rails g scaffold region name:string display_name:string alpha2_code_iso3166:string numeric_code_iso3166:string
```

## Contacts

```bash
bin/rails g scaffold contact given_name:string family_name:string email:string phone:string
```
