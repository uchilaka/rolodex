# Scaffolding

To teardown a scaffold, run `bin/rails destroy scaffold <scaffold_name>`

## 1. Regions ✅

```bash
bin/rails g scaffold region name:string display_name:string alpha2_code_iso3166:string numeric_code_iso3166:string
```

## 2. Contacts & Organizations

```bash
# Contact model with basic attributes
bin/rails g model contact given_name:string family_name:string email:string phone:string

# Organization model with basic attributes
bin/rails g model org name:string email:string phone:string
```

## 3. Addresses

```bash
# Address model with region association
bin/rails g model address google_place_id:string street_line_1:string street_line_2:string locale:string postal_code:string region:references

# ReachableAddress model for polymorphic association
bin/rails g model reachable_address reachable:references{polymorphic} address:references is_primary:boolean type:string
```

## 4. Contact Information

```bash
# ContactInfo model for emails and phone numbers
bin/rails g model contact_info reachable:references{polymorphic} type:string value:string is_primary:boolean
```

## 5. Employment Records

```bash
# EmploymentRecord model for work history
bin/rails g model employment_record hireable:references{polymorphic} employer:references employer_type:string occupation:string is_current:boolean start_date:date end_date:date
```

## 6. Donor Integration

```bash
# Donor model
bin/rails g model donor external_id:string

# Donation model
bin/rails g model donation donor:references amount:decimal currency:string donation_date:datetime campaign_id:integer payment_method:string status:string
```

## 7. Notes

```bash
# Note model for both contacts and organizations
bin/rails g model note notable:references{polymorphic} content:text
```

## 8. Identity Management

```bash
# IdentitiesDonors join table for contact/donor matching
bin/rails g model identities_donors identity:references{polymorphic} donor:references is_primary:boolean
```

## Running Migrations

After generating all models, run:

```bash
bin/rails db:migrate
```
