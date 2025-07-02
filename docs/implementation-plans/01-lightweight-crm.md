# Lightweight CRM Implementation Plan for Donation Platform

- [Lightweight CRM Implementation Plan for Donation Platform](#lightweight-crm-implementation-plan-for-donation-platform)
  - [Overview](#overview)
  - [Core Features](#core-features)
  - [Data Modeling](#data-modeling)
    - [1. Contact Management](#1-contact-management)
    - [2. Donor Integration](#2-donor-integration)
    - [3. Contact Record Consolidation](#3-contact-record-consolidation)
  - [Model Scaffolding Order](#model-scaffolding-order)
  - [Technical Implementation](#technical-implementation)
    - [Contact Merging Logic](#contact-merging-logic)
    - [Backend](#backend)
      - [a. API Endpoints](#a-api-endpoints)
      - [b. Services](#b-services)
    - [Frontend](#frontend)
      - [a. Pages](#a-pages)
      - [b. Components](#b-components)
    - [Data Flow](#data-flow)
      - [a. Contact Creation/Update](#a-contact-creationupdate)
      - [b. Donor Linking](#b-donor-linking)
      - [c. Record Consolidation](#c-record-consolidation)
  - [Security Considerations](#security-considerations)
  - [Testing Strategy](#testing-strategy)
  - [Deployment](#deployment)
  - [Future Enhancements](#future-enhancements)

## Overview

This document outlines the implementation plan for a lightweight CRM system to manage contact records for a donation platform.

The system will focus on maintaining accurate contact information and linking it to donor records.

## Core Features

- Each contact record is a `hireable` and `reachable`
- Each organization record is a `hireable` and `reachable`
- Each contact and organization can have multiple `ContactInfo` records
- Each contact and organization can have multiple `EmploymentRecord` records
- Each contact and organization can have multiple `Address` records
- Each reachable address can be of type `HomeAddress`, `WorkAddress`, or `OtherAddress`
- Each address is linked to a `Region`
- Each address is linked to a `GooglePlace` (external)
- `Address` records are owned and maintained by the system and once created cannot be edited by the user

## Data Modeling

- `content` on Notes is rich text content (i.e. `ActionText`)
- `Contact`, `Org`, `ContactInfo`, `IdentitiesDonors`, `EmploymentRecord` and `Notes` implement `paper_trail` for auditing

### 1. Contact Management

- Contact `hireable`, `identifyable`, `notable` & `reachable` (id, given_name, family_name, created_at, updated_at)
- Org `hireable`, `identifyable`, `notable` & `reachable` (id, name, display_name, tax_id, email, phone, created_at, updated_at)
- ContactInfo (id, reachable_id,reachable_type, type [EmailAddress/PhoneNumber], value, is_primary, created_at, updated_at)
- EmploymentRecord (id, hireable_id, hireable_type, employer_id, occupation, is_current, start_date, end_date)
- Address `notable` (id, google_place_id, street_line_1, street_line_2, locale, region_id, postal_code)
- ReachableAddress `notable` (id, reachable_id, reachable_type, address_id, is_primary, type [HomeAddress/WorkAddress/OtherAddress])
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

2. [x] **Notes**
    - Depends on `notable` interface (Contact/Org/Donor/Donation)
    - Uses polymorphic association
    - Attributes: `content` (rich text)

3. [ ] **Contacts**
    - Base model that implements `hireable`, `identifiable`, `notable` and `reachable` interfaces
    - Core entity for the system
    - Attributes: `given_name`, `family_name`

4. [ ] **Orgs**
    - Base model that implements `hireable`, `identifiable`, `notable` and `reachable` interfaces
    - Core entity for the system
    - Attributes: `name`, `display_name`, `tax_id`, `email`, `phone`

5. [ ] **Addresses**
    - Depends on Regions
    - System-owned and immutable
    - Contains `google_place_id`, `street_line_1`, `street_line_2`, `locale`, `postal_code`
    - Implements `notable` interface

6. [ ] **ReachableAddress**
    - Depends on both `Address` and `reachable` interface (Contact/Org)
    - Handles the polymorphic association with `reachable`
    - Manages address types (Home/Work/Other) and `is_primary`
    - Implements `notable` interface

7. [ ] **ContactData**
    - Depends on `reachable` interface (Contact/Org)
    - Uses polymorphic association with `reachable_id` and `reachable_type`
    - Attributes: `type` (EmailAddress/PhoneNumber), `value`, `is_primary`

8. [ ] **EmploymentRecords**
    - Depends on `hireable` interface (Contact/Org)
    - Requires polymorphic association with `hireable`
    - Links to employer (which is an Org)
    - Attributes: `occupation`, `is_current`, `start_date`, `end_date`

9. [ ] **Donors**
    - Independent model
    - Will be linked to Contacts/Orgs through IdentitiesDonors
    - Implements `notable` interface
    - Attributes: `external_id`

10. [ ] **Donations**
    - Depends on Donor
    - Tracks individual donations
    - Implements `notable` interface
    - Attributes: `amount`, `currency`, `donation_date`, `campaign_id`, `payment_method`, `status`

11. [ ] **IdentitiesDonors**
    - Depends on both `identity` (Contact/Org) and `donor`
    - Establishes many-to-many relationship between identities and donors
    - Tracks primary identity for each donor
    - Attributes: `is_primary`

## Technical Implementation

### Contact Merging Logic

- Identify potential duplicates based on name, email, phone
- Manual review and merge process
- History tracking of merged records

### Backend

#### a. API Endpoints

- CRUD operations for Contacts
- Donor linking/unlinking
- Contact search and filtering
- Donation history retrieval
- Contact merging

#### b. Services

- ContactService: Handle contact CRUD operations
- DonorService: Manage donor relationships
- DeduplicationService: Identify and merge duplicate contacts
- Import/Export: For bulk operations

### Frontend

#### a. Pages

- Contact list with search/filter
- Contact detail view
- Contact creation/editing form
- Donation history view
- Contact merging interface

#### b. Components

- Contact card
- Donation history table
- Merge suggestions panel
- Quick edit forms

### Data Flow

#### a. Contact Creation/Update

- User creates/updates contact
- System validates and saves data
- Optional: Check for potential duplicates

#### b. Donor Linking

- User links existing donor record to contact
- System creates association
- Donation history becomes available

#### c. Record Consolidation

- System suggests potential duplicates
- User reviews and confirms merge
- System combines records, preserving all data

## Security Considerations

- Role-based access control
- Audit logging for sensitive operations
- Data validation and sanitization
- Rate limiting for API endpoints

## Testing Strategy

- Unit tests for core logic
- Integration tests for API endpoints
- End-to-end tests for critical user flows
- Performance testing for bulk operations

## Deployment

- Staging environment for testing
- Blue-green deployment for zero-downtime updates
- Database migrations
- Monitoring and alerting setup

## Future Enhancements

- Automated duplicate detection
- Bulk import/export functionality
- Advanced reporting and analytics
- Integration with email/marketing tools
