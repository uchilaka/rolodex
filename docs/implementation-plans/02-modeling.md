# Lightweight CRM: Data Models

- `content` on Notes is rich text content (i.e. `ActionText`)
- `Contact`, `Org`, `ContactInfo`, `IdentitiesDonors`, `EmploymentRecord` and `Notes` implement `paper_trail` for auditing

## Schema & attributes

### 1. Contact Management

- Contact `hireable`, `identifyable`, `notable` & `reachable` (id, given_name, family_name, email, phone, created_at, updated_at)
- Org `hireable`, `identifyable`, `notable` & `reachable` (id, name, email, phone, created_at, updated_at)
- ContactInfo (id, reachable_id,reachable_type, type [EmailAddress/PhoneNumber], value, is_primary, created_at, updated_at)
- EmploymentRecord (id, hireable_id, hireable_type, employer_id, occupation, is_current, start_date, end_date)
- Address (id, google_place_id, street_line_1, street_line_2, locale, region_id, postal_code)
- ReachableAddress (id, reachable_id, reachable_type, address_id, is_primary, type [HomeAddress/WorkAddress/OtherAddress])
- Regions (id, name, display_name, alpha2_code_iso3166, numeric_code_iso3166, created_at, updated_at)
- Notes (id, notable_id, notable_type, created_at, updated_at)

### 2. Donor Integration

- Donor `notable` (id, external_id, created_at, updated_at)
- Donation `notable` (id, donor_id, amount, currency, donation_date, campaign_id, payment_method, status)

### 3. Contact Record Consolidation

- IdentitiesDonors (identity_id, identity_type, donor_id, is_primary, created_at, updated_at)

## Model Scaffolding Order

The following order should be followed when scaffolding the models to ensure all dependencies are satisfied:

1. [x] **Regions**
    - Independent model
    - Required by Address model

2. [ ] **Contact & Org** (can be created in parallel)
    - Base models that implement `hireable` and `reachable` interfaces
    - Core entities for the system

3. [ ] **Address**
    - Depends on Regions
    - System-owned and immutable
    - Contains `google_place_id`

4. [ ] **ReachableAddress**
    - Depends on both `Address` and `reachable` interface
    - Handles the polymorphic association
    - Manages address types (Home/Work/Other) and `is_primary`

5. [ ] **ContactInfo**
    - Depends on `reachable` interface (Contact/Org)
    - Uses polymorphic association with `reachable_id` and `reachable_type`

6. [ ] **EmploymentRecord**
    - Depends on `hireable` interface
    - Uses polymorphic association with `hireable_id` and `hireable_type`
    - References `employer_id` (from Contact/Org)

7. [ ] **Donor**
    - Independent model
    - No dependencies on other models

8. [ ] **Donation**
    - Depends on Donor
    - References `donor_id`

9. [ ] **IdentitiesDonors**
    - Junction table between identities (Contact/Org) and Donors
    - Should be created last as it depends on both identity and donor models
