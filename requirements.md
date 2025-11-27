# Flutter UI Design Specification Document
## Event Management Application

**Document Version:** 1.0  
**Last Updated:** November 26, 2025  
**Target Platforms:** Mobile (iOS/Android) & Web

---

## Table of Contents
1. [Design System Overview](#1-design-system-overview)
2. [Authentication Screens](#2-authentication-screens)
3. [Dashboard](#3-dashboard)
4. [Lead Management](#4-lead-management)
5. [Client Management](#5-client-management)
6. [Order Management](#6-order-management)
7. [Event Management](#7-event-management)
8. [Quotation Management](#8-quotation-management)
9. [Setup & Master Data](#9-setup--master-data)
10. [User & Role Management](#10-user--role-management)
11. [Communication Module](#11-communication-module)
12. [Miscellaneous Screens](#12-miscellaneous-screens)

---

## 1. Design System Overview

### 1.1 General Guidelines
- **Responsive Design:** All screens must adapt to mobile (320px-768px), tablet (768px-1024px), and desktop (1024px+) viewports
- **Navigation:** Bottom navigation for mobile, side drawer/rail for tablet/desktop
- **Typography:** Material Design 3 typography scale
- **Spacing:** Use 8px grid system (8, 16, 24, 32, 40, 48px)
- **Elevation:** Material Design elevation levels (0-5)

### 1.2 Color Palette (Suggested)
- **Primary:** #1976D2 (Blue)
- **Secondary:** #FFA726 (Orange)
- **Error:** #D32F2F (Red)
- **Success:** #388E3C (Green)
- **Warning:** #F57C00 (Orange)
- **Background:** #F5F5F5 (Light Grey)
- **Surface:** #FFFFFF (White)
- **Text Primary:** #212121 (Dark Grey)
- **Text Secondary:** #757575 (Medium Grey)

### 1.3 Common Components
- **Buttons:** Primary (Filled), Secondary (Outlined), Text buttons
- **Cards:** Elevated cards with 8px border radius
- **Tables:** Data tables with sorting, filtering, pagination
- **Modals:** Bottom sheets (mobile), dialogs (tablet/desktop)
- **Forms:** Outlined text fields with floating labels
- **Snackbars:** For success/error messages
- **Loading States:** Circular progress indicators or skeleton screens

---

## 2. Authentication Screens

### 2.1 Login Screen

**Route:** `/login`  
**Platform Variations:** Full-screen on mobile, split-screen on tablet/desktop

#### Layout Structure

**Mobile (Portrait):**
```
┌─────────────────────────┐
│   [App Logo/Branding]   │
│         (Top)           │
├─────────────────────────┤
│                         │
│    [Login Form Card]    │
│                         │
│   • Email Field         │
│   • Password Field      │
│   • Sign In Button      │
│   • Forgot Password     │
│                         │
└─────────────────────────┘
```

**Tablet/Desktop:**
```
┌───────────────────┬───────────────────┐
│                   │                   │
│  [Promotional     │   [Login Form]    │
│   Image/Brand]    │                   │
│                   │   • Email         │
│   • Hero Image    │   • Password      │
│   • Tagline       │   • Sign In Btn   │
│   • Features      │   • Forgot Pass   │
│                   │                   │
└───────────────────┴───────────────────┘
```

#### Components & Specifications

**1. Promotional Section (Desktop/Tablet Only)**
- **Width:** 50% of screen
- **Background:** Gradient or brand image
- **Content:**
  - App logo (48x48 dp)
  - Heading: "Event Management System" (H4, 34sp)
  - Subheading: Feature highlights (Body1, 16sp)
  - Hero illustration/image

**2. Login Form Card**
- **Width:** Mobile: 90% screen width, Desktop: 400px fixed
- **Padding:** 24dp all sides
- **Elevation:** 2dp
- **Border Radius:** 8dp

**3. Email Field**
- **Type:** TextFormField (outlined)
- **Label:** "Email Address"
- **Keyboard Type:** Email
- **Validation:**
  - Required field indicator (*)
  - Email format validation
  - Error message: "Please enter a valid email address"
- **Icon:** Leading email icon (optional)
- **Height:** 56dp

**4. Password Field**
- **Type:** TextFormField (outlined)
- **Label:** "Password"
- **Obscure Text:** True (default)
- **Validation:**
  - Required field indicator (*)
  - Minimum 6 characters (if enforced)
  - Error message: "Password is required"
- **Suffix Icon:** Toggle visibility (eye/eye-off icon)
- **Height:** 56dp
- **Spacing from Email:** 16dp

**5. Sign In Button**
- **Type:** ElevatedButton
- **Width:** 100% of form width
- **Height:** 48dp
- **Label:** "Sign In"
- **Style:** Primary color background
- **Spacing from Password:** 24dp
- **Loading State:** Show circular progress indicator when processing

**6. Forgot Password Link**
- **Type:** TextButton
- **Alignment:** Center
- **Label:** "Forgot Password?"
- **Spacing from Button:** 8dp
- **Text Style:** Body2, Secondary color

#### Interactions & States

**1. Form Validation**
- Validate on submit
- Show error messages below respective fields
- Highlight fields with errors in red
- Disable submit button while processing

**2. API Integration**
- **Endpoint:** POST `/login`
- **Request Body:** `{ email: string, password: string }`
- **Success:** Navigate to dashboard, store auth token
- **Error:** Display snackbar with error message

**3. Loading State**
- Disable all form inputs
- Show progress indicator on button
- Optional: Overlay with semi-transparent background

---

## 3. Dashboard

### 3.1 Dashboard Screen

**Route:** `/dashboard`  
**Purpose:** Main overview with key metrics and quick actions

#### Layout Structure

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar]              │
│  "Dashboard"            │
├─────────────────────────┤
│  [Metric Card 1]        │
├─────────────────────────┤
│  [Metric Card 2]        │
├─────────────────────────┤
│  [Metric Card 3]        │
├─────────────────────────┤
│  [Metric Card 4]        │
├─────────────────────────┤
│  [Metric Card 5]        │
└─────────────────────────┘
```

**Tablet/Desktop:**
```
┌─────────────────────────────────────┐
│  [App Bar] "Dashboard"              │
├──────────────┬──────────────┬───────┤
│ [Card 1]     │ [Card 2]     │[Card3]│
├──────────────┼──────────────┼───────┤
│ [Card 4]     │ [Card 5]     │       │
└──────────────┴──────────────┴───────┘
```

#### Metric Cards Specification

**Card Dimensions:**
- Mobile: Full width minus 16dp padding each side
- Tablet: 2 cards per row with 16dp gap
- Desktop: 3 cards per row with 16dp gap
- Height: Auto (minimum 120dp)
- Elevation: 2dp
- Border Radius: 12dp
- Padding: 16dp

**Card 1: Upcoming Orders**
- **Icon:** Calendar icon (24dp, primary color)
- **Title:** "Upcoming Orders" (Body2, Text Secondary)
- **Value:** Count number (H4, 34sp, Text Primary)
- **Subtitle:** "Events in next 30 days" (Caption, Text Secondary)
- **Background:** White
- **Tap Action:** Navigate to orders list filtered by upcoming

**Card 2: Unassigned Orders**
- **Icon:** Alert/Warning icon (24dp, warning color)
- **Title:** "Unassigned Orders" (Body2)
- **Value:** Count number (H4)
- **Subtitle:** "Requires team assignment" (Caption)
- **Highlight:** Warning color accent if count > 0
- **Tap Action:** Navigate to orders list filtered by unassigned

**Card 3: Due Payment Orders**
- **Icon:** Currency/Payment icon (24dp, error color)
- **Title:** "Due Payment Orders" (Body2)
- **Value:** Count number (H4)
- **Subtitle:** "Overdue payments" (Caption)
- **Highlight:** Error color accent if count > 0
- **Tap Action:** Navigate to orders with payment due

**Card 4: Total Clients**
- **Icon:** People/Users icon (24dp, success color)
- **Title:** "Total Clients" (Body2)
- **Value:** Count number (H4)
- **Subtitle:** "Active clients" (Caption)
- **Note:** *Clarification needed: Shows clients or team members?*
- **Tap Action:** Navigate to clients list

**Card 5: Total Orders**
- **Icon:** List/Document icon (24dp, secondary color)
- **Title:** "Total Orders" (Body2)
- **Value:** Count number (H4)
- **Subtitle:** "All time" (Caption)
- **Tap Action:** Navigate to all orders

#### Additional Components

**App Bar:**
- **Title:** "Dashboard"
- **Leading:** Menu icon (mobile) or none (desktop with persistent drawer)
- **Actions:** Notification icon, profile avatar
- **Elevation:** 0dp (flat with background)

**Pull-to-Refresh:**
- Implement on mobile for refreshing dashboard data
- Show refresh indicator at top

**Empty State:**
- If no data, show illustration with message
- "Getting started" guide for new users

---

## 4. Lead Management

### 4.1 Lead List Screen

**Route:** `/lead`  
**Purpose:** Display all leads with search and filter capabilities

#### Layout Structure

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar]              │
│  "Leads"     [Search]   │
├─────────────────────────┤
│  [Filters Row]          │
├─────────────────────────┤
│  [Lead Card 1]          │
├─────────────────────────┤
│  [Lead Card 2]          │
├─────────────────────────┤
│  [Lead Card 3]          │
│        ...              │
└─────────────────────────┘
│  [FAB: Add Lead]        │
└─────────────────────────┘
```

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "Leads"                   │
├──────────────────────────────────────┤
│  [Search] [Filters] [Add Lead Btn]   │
├──────────────────────────────────────┤
│  [Data Table]                        │
│  │Sr│Name│Phone│Status│Source│...│  │
│  └──────────────────────────────────┘│
│  [Pagination Controls]               │
└──────────────────────────────────────┘
```

#### Components Specification

**1. Search Bar**
- **Type:** TextField with search icon
- **Placeholder:** "Search leads..."
- **Width:** Mobile: Full width, Desktop: 300dp
- **Debounce:** 500ms delay for API calls
- **Clear Button:** Show when text entered

**2. Filter Chips/Buttons**
- **Filters:**
  - Status: All, New, In Progress, Success, Failed
  - Source: All sources from master data
  - Date Range: Custom date picker
- **Style:** Chip buttons (mobile), Dropdown (desktop)
- **Layout:** Horizontal scroll (mobile), Row (desktop)

**3. Lead Card (Mobile)**
- **Height:** Auto (minimum 100dp)
- **Padding:** 12dp
- **Elevation:** 1dp
- **Border Radius:** 8dp
- **Spacing:** 8dp between cards

**Card Content:**
```
┌──────────────────────────────┐
│ [Name] (H6)         [Status] │
│ [Phone] 📱                   │
│ [Whatsapp] 💬                │
│ [Source] • [Created Date]    │
│ ──────────────────────────── │
│ [View] [Edit] [Call] [Chat]  │
└──────────────────────────────┘
```

**4. Data Table (Desktop/Tablet)**
- **Columns:**
  - Sr (40px, center aligned, sortable)
  - Name (200px, left aligned, sortable)
  - Phone (150px, left aligned)
  - Whatsapp (150px, left aligned)
  - Status (120px, center aligned, filterable)
  - Communication Status (150px, center aligned)
  - Source (120px, left aligned, filterable)
  - Created Date (150px, right aligned, sortable)
  - Actions (100px, center aligned)
- **Row Height:** 52dp
- **Hover State:** Light grey background
- **Selection:** Checkbox for bulk actions (optional)
- **Sticky Header:** Header remains visible on scroll

**5. Status Badge**
- **Types:**
  - New: Blue chip
  - In Progress: Orange chip
  - Success: Green chip
  - Failed: Red chip
- **Size:** Small chip (24dp height)
- **Style:** Filled with white text

**6. Action Buttons**
- **View:** Eye icon button → Navigate to lead details
- **Edit:** Edit icon button → Open edit modal
- **Call:** Phone icon → Initiate call (mobile only)
- **WhatsApp:** WhatsApp icon → Open WhatsApp

**7. Floating Action Button (Mobile)**
- **Position:** Bottom right (16dp from edges)
- **Icon:** Add icon
- **Color:** Primary
- **Action:** Open add lead modal

**8. Add Lead Button (Desktop)**
- **Type:** ElevatedButton
- **Position:** Top right of screen
- **Label:** "Add Lead"
- **Icon:** Add icon (leading)

**9. Pagination**
- **Type:** PageView with page numbers
- **Items per page:** 10, 25, 50, 100 (dropdown)
- **Controls:** Previous, Page numbers, Next
- **Info:** "Showing 1-10 of 150 leads"

#### Empty State
- **Icon:** Large lead/person illustration
- **Message:** "No leads found"
- **Subtitle:** "Add your first lead to get started"
- **Action:** "Add Lead" button

---

### 4.2 Lead Details Screen

**Route:** `/lead/view/{id}`  
**Purpose:** Comprehensive view of lead information and activities

#### Layout Structure

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar] "Lead Name"  │
│  [Back] [Edit] [More]   │
├─────────────────────────┤
│  [Personal Details Card]│
├─────────────────────────┤
│  [Quotations Card]      │
├─────────────────────────┤
│  [Communications Card]  │
└─────────────────────────┘
```

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "Lead Details"            │
├──────────┬───────────────────────────┤
│          │                           │
│ Personal │    [Quotations]           │
│ Details  │    [Table]                │
│          │                           │
│ [Card]   ├───────────────────────────┤
│          │                           │
│          │    [Communications]       │
│          │    [Timeline]             │
└──────────┴───────────────────────────┘
```

#### Section 1: Personal Details Card

**Card Structure:**
- **Elevation:** 2dp
- **Padding:** 16dp
- **Border Radius:** 12dp

**Header:**
- **Title:** "Personal Details" (H6)
- **Action:** Edit icon button (top right)

**Content Layout:**
```
┌──────────────────────────────┐
│ Personal Details       [Edit]│
├──────────────────────────────┤
│ 👤 First Name: [Value]       │
│ 👤 Last Name: [Value]        │
│ 📧 Email: [Value]            │
│ 📱 Phone: [Value] [Call]     │
│ 💬 WhatsApp: [Value] [Chat]  │
│ 📍 Address: [Value]          │
├──────────────────────────────┤
│ Status: [Badge]              │
│ Communication: [Badge]       │
├──────────────────────────────┤
│ Created: [Date]              │
│ Last Updated: [Date]         │
└──────────────────────────────┘
```

**Field Specifications:**
- **Label:** Body2, Text Secondary
- **Value:** Body1, Text Primary
- **Spacing:** 12dp between rows
- **Icons:** 20dp, secondary color
- **Action Buttons:** IconButton (call, chat) next to phone/WhatsApp

#### Section 2: Quotations Card

**Header:**
- **Title:** "Quotations" (H6)
- **Action:** "Generate Quotation" button (outlined)
- **Badge:** Count of quotations (small chip)

**Table (Mobile - Card List):**
```
┌──────────────────────────────┐
│ [Quotation Card]             │
│ Wedding • [Couple Names]     │
│ 📅 [Event Date]              │
│ Status: [Badge]              │
│ [Send] [View PDF] [Update]   │
├──────────────────────────────┤
│ [Quotation Card]             │
│ ...                          │
└──────────────────────────────┘
```

**Table (Desktop - Data Table):**
- **Columns:**
  - Sr (40px)
  - Couple Names (200px)
  - Event Date (120px)
  - Event Type (120px)
  - Status (100px)
  - Actions (180px)
- **Row Height:** 48dp

**Status Types:**
- Pending: Grey chip
- Sent: Blue chip
- Success: Green chip
- Failed: Red chip

**Action Buttons per Row:**
- **Send to Client:** Email/Message icon (if Pending)
- **Update Status:** Dropdown (Success/Failed)
- **View PDF:** PDF icon → Open system-generated PDF
- **Manual PDF:** Upload icon → Add/view manual quotation
- **Remove:** Delete icon (with confirmation)

**Empty State:**
- Message: "No quotations generated"
- Action: "Generate Quotation" button

#### Section 3: Communications Card

**Header:**
- **Title:** "Communication Log" (H6)
- **Action:** "Add Log" button (icon button)

**Timeline Layout:**
```
┌──────────────────────────────┐
│ Communication Log      [Add] │
├──────────────────────────────┤
│ ● [Date Time]                │
│   [Communication Message]    │
│   Created by: [User Name]    │
├──────────────────────────────┤
│ ● [Date Time]                │
│   [Communication Message]    │
│   Created by: [User Name]    │
└──────────────────────────────┘
```

**Timeline Item:**
- **Indicator:** Circular dot (8dp) connected by line
- **Date/Time:** Caption, secondary text
- **Message:** Body2, primary text
- **Creator:** Caption, secondary text
- **Spacing:** 16dp between items

**Empty State:**
- Message: "No communication logs"
- Subtitle: "Add your first interaction"

#### Floating Action Buttons (Mobile)

**Primary FAB:**
- **Icon:** Message icon
- **Label:** "Add Communication"
- **Action:** Open add communication modal

**Secondary FAB (Extended):**
- **Icon:** Document icon
- **Label:** "Generate Quotation"
- **Action:** Open quotation modal

#### Modals

**1. Generate Quotation Modal**
- **Title:** "Generate Wedding Quotation"
- **Fields:**
  - Couple First Name (TextFormField)
  - Couple Second Name (TextFormField)
  - Event Name (Dropdown)
  - Event Date (Date Picker)
  - Event Type (Dropdown)
  - Team Members (Multi-select)
  - Commercial Details (TextFormField, multi-line)
- **Actions:** Cancel, Generate

**2. Add Communication Log Modal**
- **Title:** "Add Communication Log"
- **Fields:**
  - Communication Type (Dropdown: Call, Email, Meeting, WhatsApp)
  - Date & Time (DateTime Picker)
  - Notes (TextFormField, multi-line, 5 rows)
- **Actions:** Cancel, Save

**3. Update Status Modal**
- **Title:** "Update Lead Status"
- **Options:** Success, Failed (Radio buttons)
- **Reason Field:** TextFormField (required for Failed)
- **Actions:** Cancel, Update

---

## 5. Client Management

### 5.1 Client List Screen

**Route:** `/client`  
**Purpose:** Display all clients with filtering and search

#### Layout Structure
Similar to Lead List Screen with minor differences.

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar] "Clients"    │
│  [Search Bar]           │
├─────────────────────────┤
│  [Client Card 1]        │
├─────────────────────────┤
│  [Client Card 2]        │
├─────────────────────────┤
│        ...              │
└─────────────────────────┘
│  [FAB: Add Client]      │
└─────────────────────────┘
```

#### Components Specification

**1. Client Card (Mobile)**
```
┌──────────────────────────────┐
│ 👤 [Client Name] (H6)        │
│ 💬 [Whatsapp Number]         │
│ 📍 [Source]                  │
│ 👨‍💼 Created by: [User]       │
│ 📅 [Created Date]            │
│ ──────────────────────────── │
│ [View Details] [Edit] [Call] │
└──────────────────────────────┘
```

**2. Data Table (Desktop)**
- **Columns:**
  - Sr (40px)
  - Name (200px, sortable)
  - WhatsApp Number (150px)
  - Source (120px, filterable)
  - Created By (150px, filterable)
  - Created Date (150px, sortable)
  - Action (120px)
- **Actions:** View, Edit, Call, WhatsApp

**3. Add/Edit Client Modal**
- **Title:** "Add Client" or "Edit Client"
- **Form Fields:**
  - First Name* (TextFormField)
  - Last Name* (TextFormField)
  - Email (TextFormField, email validation)
  - Phone Number* (TextFormField, phone validation)
  - WhatsApp Number* (TextFormField)
  - Address (TextFormField, multi-line)
  - Source* (Dropdown from master data)
- **Validation:** Required fields marked with *
- **Actions:** Cancel, Save

---

### 5.2 Client Details Screen

**Route:** `/client/view/{id}`  
**Purpose:** Complete client profile with orders and quotations

#### Layout Structure

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar] [Client Name]│
├─────────────────────────┤
│  [Client Details Card]  │
├─────────────────────────┤
│  [Quotations Card]      │
├─────────────────────────┤
│  [Upcoming Orders Card] │
├─────────────────────────┤
│  [Completed Orders]     │
└─────────────────────────┘
```

#### Section 1: Client Details Card

**Similar to Lead Personal Details with these additions:**
- **Client Since:** Display date of first order
- **Total Orders:** Count badge
- **Total Revenue:** If applicable
- **Loyalty Status:** Badge (e.g., Gold, Silver, Bronze)

#### Section 2: Contact Persons Section

**If applicable - expandable section:**
- **Title:** "Contact Persons"
- **List:**
  - Name, Phone, Email, Designation
  - Action: Edit, Delete
- **Action:** Add Contact Person button

#### Section 3: Quotations Card

Same as Lead Details quotation section.

#### Section 4: Upcoming Orders Card

**Header:**
- **Title:** "Upcoming Orders" (H6)
- **Badge:** Count of upcoming orders

**Table/List:**
- **Columns/Fields:**
  - Event Name
  - Event Date
  - Event Type
  - Status
  - Action: View Details
- **Sort:** By event date (nearest first)

**Empty State:**
- Message: "No upcoming orders"
- Action: "Create Order" button

#### Section 5: Completed Orders Card

**Header:**
- **Title:** "Order History" (H6)
- **Badge:** Total count

**Table/List:**
- **Columns/Fields:**
  - Order ID
  - Event Name
  - Event Date
  - Total Amount
  - Status
  - Action: View Details
- **Pagination:** Load more or pagination controls

---

## 6. Order Management

### 6.1 Order List Screen

**Route:** `/order`  
**Purpose:** Manage all orders with status tracking

#### Layout Structure

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "Orders"                  │
├──────────────────────────────────────┤
│  [Status Tabs]                       │
│  All | Upcoming | Unassigned | Due   │
├──────────────────────────────────────┤
│  [Search & Filters]                  │
├──────────────────────────────────────┤
│  [Orders Data Table]                 │
│  [Pagination]                        │
└──────────────────────────────────────┘
```

#### Components Specification

**1. Status Tabs**
- **Tabs:**
  - All Orders (default)
  - Upcoming (event_from_date >= today)
  - Unassigned (no team members assigned)
  - Payment Due (due_amount > 0, due_date < today)
  - Completed
- **Style:** Material Design tabs with indicator
- **Badge:** Show count on each tab

**2. Order Card (Mobile)**
```
┌──────────────────────────────┐
│ [Event Name] (H6)            │
│ 👰‍♀️ [Client Name]            │
│ 📅 [Event Date]              │
│ 📍 [Venue/Location]          │
│ Status: [Badge]              │
│ Payment: [Progress Bar]      │
│ Assigned: [Avatar Group]     │
│ ──────────────────────────── │
│ [View] [Edit] [Assign Team]  │
└──────────────────────────────┘
```

**3. Data Table (Desktop)**
- **Columns:**
  - Order ID (80px)
  - Client Name (150px, sortable)
  - Event Name (180px, sortable)
  - Event Date (120px, sortable)
  - Event Type (120px, filterable)
  - Status (120px, filterable)
  - Payment Status (150px)
  - Assigned Team (120px)
  - Actions (150px)

**4. Payment Status Indicator**
- **Type:** Progress bar or badge
- **States:**
  - Fully Paid: Green badge "Paid"
  - Partial Payment: Orange progress bar with amount
  - No Payment: Red badge "Pending"
  - Overdue: Red badge "Overdue" with amount

**5. Assigned Team Display**
- **Type:** Avatar group (stacked avatars)
- **Limit:** Show first 3, then "+N" indicator
- **No Assignment:** Warning icon with "Assign Team" button

---

### 6.2 Order Details Screen

**Route:** `/order/view/{id}`  
**Purpose:** Complete order information and management

#### Layout Structure

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "Order #[ID]"             │
├──────────┬───────────────────────────┤
│          │                           │
│  Order   │  [Event Information]      │
│  Info    │  [Services & Team]        │
│  Card    │  [Payment Details]        │
│          │  [Documents]              │
└──────────┴───────────────────────────┘
```

#### Section 1: Order Information Card

```
┌──────────────────────────────┐
│ Order Information      [Edit]│
├──────────────────────────────┤
│ Order ID: #[ID]              │
│ Client: [Name] [View]        │
│ Event Name: [Name]           │
│ Event Type: [Type]           │
│ Event Date: [Date Range]     │
│ Venue: [Location]            │
│ Status: [Badge]              │
├──────────────────────────────┤
│ Created: [Date]              │
│ Last Updated: [Date]         │
└──────────────────────────────┘
```

#### Section 2: Services & Team Assignment

**Header:**
- **Title:** "Service Assignment" (H6)
- **Action:** "Add Service" button

**Table:**
- **Columns:**
  - Service Category (Primary Service)
  - Sub Service
  - Assigned Member
  - Status
  - Actions
- **Row Actions:**
  - Assign/Change: Opens team member selection modal
  - Remove: Removes service from order

**Team Member Selector:**
- **Filter by:** Category/Role
- **Display:** Avatar, Name, Category
- **Multi-select:** If service requires multiple members

#### Section 3: Assigned Team Members

**Display:**
- **List of team members with:**
  - Avatar
  - Name
  - Role/Category
  - Contact (Call/WhatsApp buttons)
  - Assigned Services
  - Response Status (Accepted/Pending/Rejected)
  - Action: Remove

**Empty State:**
- Message: "No team members assigned"
- Action: "Assign Team" button

#### Section 4: Payment Details

```
┌──────────────────────────────┐
│ Payment Details        [Edit]│
├──────────────────────────────┤
│ Total Amount: ₹[Amount]      │
│ Paid Amount: ₹[Amount]       │
│ Due Amount: ₹[Amount]        │
│ ──────────────────────────── │
│ [Payment Progress Bar]       │
├──────────────────────────────┤
│ Payment Schedule:            │
│ • [Date]: ₹[Amount] [Status] │
│ • [Date]: ₹[Amount] [Status] │
├──────────────────────────────┤
│ [Record Payment] [Add Due]   │
└──────────────────────────────┘
```

#### Section 5: Message Log

**Timeline showing:**
- Messages sent to team
- Date/Time
- Recipients
- Message content
- Delivery status

**Action:** Send new message to team

#### Section 6: Team Responses

**Two tabs:**
1. **Accepted:** Green list of team members who accepted
2. **Rejected:** Red list with rejection reasons

---

## 7. Event Management

### 7.1 Event List Screen

**Route:** `/event`  
**Purpose:** Calendar and list view of events

#### Layout Structure

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar] "Events"     │
│  [View Toggle]          │
│  Calendar | List        │
├─────────────────────────┤
│  [Calendar View]        │
│        OR               │
│  [Event List]           │
└─────────────────────────┘
```

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "Events"                  │
├──────────────────────────────────────┤
│  [Month Navigation] [View: Cal/List] │
├──────────────────────────────────────┤
│  [Full Calendar View]                │
│  or                                  │
│  [Events Data Table]                 │
└──────────────────────────────────────┘
```

#### Components Specification

**1. Calendar View**
- **Type:** Monthly calendar with event markers
- **Event Indicator:** Colored dots on dates with events
- **Color Coding:**
  - Blue: Assigned events
  - Orange: Unassigned events
  - Green: Completed events
- **Tap Action:** Show events for that date

**2. Event List (Mobile Cards)**
```
┌──────────────────────────────┐
│ 📅 [Date] (H6)               │
├──────────────────────────────┤
│ [Event Name]                 │
│ 👰‍♀️ [Client Name]            │
│ 📍 [Venue]                   │
│ Team: [Avatars] or [Assign]  │
│ [View Details]               │
├──────────────────────────────┤
│ [Next Event Card]            │
└──────────────────────────────┘
```

**3. Data Table (Desktop)**
- **Columns:**
  - Sr (40px)
  - Date (120px, sortable)
  - Lead/Client Name (150px, sortable)
  - Event Name (180px)
  - Event Type (120px, filterable)
  - Assigned Team Member (180px)
  - [Dynamic Primary Services Columns]
  - Actions (100px)

**Dynamic Service Columns:**
- Show columns for each primary service
- Display assigned team member name or "Unassigned"
- Color code: Green (assigned), Red (unassigned)

**4. Assign Team Member Modal**
- **Trigger:** Click on unassigned service cell
- **Title:** "Assign Team Member"
- **Content:**
  - Service Name (read-only)
  - Team Member Dropdown (filtered by service category)
  - Notes (optional)
- **Actions:** Cancel, Assign

---

### 7.2 Event Details Screen

**Route:** `/event/view/{id}`  
**Purpose:** Event-specific view focused on team management

Similar to Order Details but with emphasis on:
- Team assignment status
- Service checklist
- Event timeline
- Communication with team

---

## 8. Quotation Management

### 8.1 Quotation List Screen

**Route:** `/quotation`  
**Purpose:** Track quotation status and actions

#### Layout Structure

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "Quotations"              │
├──────────────────────────────────────┤
│  [Status Filter Chips]               │
│  All | Pending | Sent | Success | Failed│
├──────────────────────────────────────┤
│  [Search & Date Filter]              │
├──────────────────────────────────────┤
│  [Quotations Table]                  │
│  [Pagination]                        │
└──────────────────────────────────────┘
```

#### Components Specification

**1. Status Filter Chips**
- **Chips:**
  - All (default)
  - Pending: Grey chip with count
  - Sent: Blue chip with count
  - Success: Green chip with count
  - Failed: Red chip with count
- **Behavior:** Single selection, updates table

**2. Quotation Card (Mobile)**
```
┌──────────────────────────────┐
│ [Couple Names] (H6)          │
│ 👰‍♀️ [Lead/Client Name]       │
│ 📅 [Event Date]              │
│ 💼 [Event Name]              │
│ Status: [Badge]              │
│ ──────────────────────────── │
│ [Send] [View PDF] [Status▼]  │
└──────────────────────────────┘
```

**3. Data Table (Desktop)**
- **Columns:**
  - Sr (40px)
  - Lead/Client Name (150px, sortable, searchable)
  - Couple Names (180px)
  - Event Date (120px, sortable)
  - Event Name (150px)
  - Status (120px, filterable)
  - Actions (220px)

**4. Action Buttons**
- **Send to Client:** Visible only for Pending status
  - Icon: Send/Email icon
  - Opens send confirmation modal
- **Update Status:** Dropdown button
  - Options: Mark as Sent, Success, Failed
  - Opens status update modal
- **View PDF:** Multiple options
  - System PDF: Auto-generated quotation
  - Manual PDF: User-uploaded document
  - Dropdown if both exist
- **Add Manual File:** Upload icon
  - Opens file upload modal
- **Remove Manual File:** Delete icon with confirmation

#### Modals

**1. Add Quotation Modal**
- **Title:** "Generate Quotation"
- **Layout:** Stepper or single form

**Form Fields:**
```
┌──────────────────────────────┐
│ Generate Quotation     [×]   │
├──────────────────────────────┤
│ Lead/Client*                 │
│ [Dropdown Search]            │
├──────────────────────────────┤
│ Couple Details               │
│ First Name* [Text]           │
│ Second Name [Text]           │
├──────────────────────────────┤
│ Event Details                │
│ Event Name* [Dropdown]       │
│ Event Date* [Date Picker]    │
│ Event Type* [Dropdown]       │
├──────────────────────────────┤
│ Team Assignment              │
│ [Multi-Select Chips]         │
├──────────────────────────────┤
│ Commercial Details           │
│ [Multi-line Text Field]      │
│ (5 rows minimum)             │
├──────────────────────────────┤
│ [Cancel] [Generate Quotation]│
└──────────────────────────────┘
```

**Field Specifications:**
- **Lead/Client Dropdown:**
  - Searchable
  - Shows name + phone
  - Required field
- **Couple Names:**
  - First Name: Required
  - Second Name: Optional
- **Event Details:**
  - Event Name: Dropdown (Wedding, Birthday, Corporate, etc.)
  - Date: Date picker with min date = today
  - Event Type: Dropdown linked to event name
- **Team Assignment:**
  - Multi-select with checkboxes
  - Grouped by category
  - Show avatar + name
- **Commercial Details:**
  - Rich text or plain text
  - Placeholder: "Enter pricing, terms, and conditions"

**2. Send to Client Modal**
- **Title:** "Send Quotation"
- **Options:**
  - Send via Email: Checkbox, email field
  - Send via WhatsApp: Checkbox
  - Include Message: Text area
- **Preview:** Show quotation thumbnail
- **Actions:** Cancel, Send

**3. Add Manual Quotation File Modal**
- **Title:** "Upload Manual Quotation"
- **File Upload:**
  - Drag & drop area
  - File type: PDF only
  - Max size: 10MB
  - Preview after upload
- **Contact Person Details (Optional):**
  - Name [Text]
  - Phone [Text]
  - Email [Text]
- **Actions:** Cancel, Upload

**4. Update Status Modal**
- **Title:** "Update Quotation Status"
- **Status Options:** Radio buttons
  - Sent
  - Success
  - Failed
- **If Failed - Additional Fields:**
  - Reason (Dropdown or Text)
  - Notes (Text area)
- **Actions:** Cancel, Update

---

## 9. Setup & Master Data

### 9.1 Common Resource Screen Pattern

All master data screens follow a similar pattern:
- List view with table
- Add/Edit modal
- Delete confirmation
- Search and filter

#### Generic Layout

**Desktop:**
```
┌──────────────────────────────────────┐
│  [App Bar] "[Resource Name]"         │
├──────────────────────────────────────┤
│  [Search Bar] [Add [Resource] Btn]   │
├──────────────────────────────────────┤
│  [Data Table]                        │
│  │Name│Description│Status│Actions│   │
│  [Pagination]                        │
└──────────────────────────────────────┘
```

**Mobile:**
```
┌─────────────────────────┐
│  [App Bar]              │
│  [Search Bar]           │
├─────────────────────────┤
│  [Resource Card 1]      │
├─────────────────────────┤
│  [Resource Card 2]      │
└─────────────────────────┘
│  [FAB: Add]             │
└─────────────────────────┘
```

---

### 9.2 Lead Source Screen

**Route:** `/lead-source`  
**Purpose:** Manage sources of leads

**Table Columns:**
- Name (e.g., Facebook, Instagram, Referral)
- Description (optional)
- Status (Active/Inactive toggle)
- Actions (Edit, Delete)

**Add/Edit Form:**
- Name* (TextFormField)
- Description (TextFormField, multi-line)
- Status (Switch: Active/Inactive)

---

### 9.3 Team Member Screen

**Route:** `/team-member`  
**Purpose:** Manage team members/staff

**Table Columns:**
- Avatar
- Name
- Category (Role)
- Phone Number
- Email
- WhatsApp Number
- Status
- Actions

**Add/Edit Form:**
- Profile Picture (Image picker)
- First Name* (TextFormField)
- Last Name* (TextFormField)
- Category* (Dropdown: Team Member Categories)
- Phone Number* (TextFormField)
- Email (TextFormField)
- WhatsApp Number* (TextFormField)
- Status (Switch)

---

### 9.4 Event Type Screen

**Route:** `/event-type`  
**Purpose:** Define types of events

**Examples:** Wedding, Birthday Party, Corporate Event, Anniversary

**Table Columns:**
- Name
- Description
- Icon (optional)
- Status
- Actions

**Add/Edit Form:**
- Name* (TextFormField)
- Description (TextFormField)
- Icon (Icon picker - optional)
- Status (Switch)

---

### 9.5 Primary Service Screen

**Route:** `/primary-service`  
**Purpose:** Main service categories

**Examples:** Photography, Decoration, Catering, DJ, Venue

**Table Columns:**
- Service Name
- Description
- Icon
- Status
- Sub Services Count
- Actions

**Add/Edit Form:**
- Service Name* (TextFormField)
- Description (TextFormField)
- Icon (Icon picker)
- Status (Switch)

---

### 9.6 Sub Service Screen

**Route:** `/sub-service`  
**Purpose:** Sub-categories under primary services

**Table Columns:**
- Sub Service Name
- Primary Service (parent)
- Description
- Status
- Actions

**Add/Edit Form:**
- Primary Service* (Dropdown)
- Sub Service Name* (TextFormField)
- Description (TextFormField)
- Status (Switch)

---

### 9.7 Team Member Category Screen

**Route:** `/team-member-category`  
**Purpose:** Roles/categories for team members

**Examples:** Photographer, Videographer, Decorator, Chef, DJ

**Table Columns:**
- Category Name
- Description
- Related Service (optional)
- Status
- Member Count
- Actions

**Add/Edit Form:**
- Category Name* (TextFormField)
- Description (TextFormField)
- Related Primary Service (Dropdown - optional)
- Status (Switch)

---

### 9.8 Admin Notification Number Screen

**Route:** `/admin-notification-number`  
**Purpose:** Phone numbers for admin alerts

**Table Columns:**
- Phone Number
- Name/Label
- Status (Active/Inactive toggle)
- Actions

**Add/Edit Form:**
- Name/Label* (TextFormField)
- Phone Number* (TextFormField with validation)
- Status (Switch: Active/Inactive)

---

### 9.9 Notification Screen

**Route:** `/notification`  
**Purpose:** Notification templates and settings

**Table Columns:**
- Template Name
- Type (Email/SMS/WhatsApp/Push)
- Trigger Event
- Status
- Actions

**Add/Edit Form:**
- Template Name* (TextFormField)
- Type* (Dropdown: Email, SMS, WhatsApp, Push)
- Trigger Event* (Dropdown)
- Subject (for Email)
- Message Template* (Rich text editor with variables)
- Status (Switch)

**Variables:** Show available variables like {name}, {date}, {event_name}

---

### 9.10 Package Screen

**Route:** `/package`  
**Purpose:** Service packages/bundles

**List View:**
```
┌──────────────────────────────┐
│ [Package Card 1]             │
│ Package Name (H5)            │
│ ₹ Price                      │
│ Services: [Chips]            │
│ [Edit] [Delete] [View]       │
├──────────────────────────────┤
│ [Package Card 2]             │
└──────────────────────────────┘
```

**Add/Edit Form:**
- Package Name* (TextFormField)
- Description (TextFormField, multi-line)
- Price* (Number field with currency)
- Services Included* (Multi-select checkboxes)
  - Show primary services with sub-services
  - Tree structure selection
- Package Duration (Number field with unit)
- Terms & Conditions (Rich text)
- Status (Switch)
- Display Image (Image picker)

---

## 10. User & Role Management

### 10.1 Users Screen

**Route:** `/users`  
**Purpose:** Manage system users

**Table Columns:**
- Avatar
- Name
- Email
- Role
- Status (Active/Inactive)
- Last Login
- Actions

**Add/Edit User Form:**
- Profile Picture (Image picker)
- First Name* (TextFormField)
- Last Name* (TextFormField)
- Email* (TextFormField with validation)
- Password* (TextFormField - only for new users)
- Role* (Dropdown)
- Status (Switch)
- Permissions Override (Optional checkboxes)

---

### 10.2 Roles Screen

**Route:** `/roles`  
**Purpose:** Define roles and permissions

**List View:**
```
┌──────────────────────────────┐
│ Role Card                    │
│ Admin (H6)                   │
│ Users: 5                     │
│ Permissions: 45/50           │
│ [Edit] [Delete] [Duplicate]  │
└──────────────────────────────┘
```

**Add/Edit Role Form:**
- Role Name* (TextFormField)
- Description (TextFormField)
- Permissions* (Grouped checkboxes)
  - Group by module:
    - Lead Management (View, Add, Edit, Delete)
    - Client Management (View, Add, Edit, Delete)
    - Order Management (View, Add, Edit, Delete)
    - Event Management (View, Add, Edit, Delete)
    - Quotation Management (View, Add, Edit, Delete, Send)
    - Setup & Master Data (View, Add, Edit, Delete)
    - User Management (View, Add, Edit, Delete)
    - Reports (View, Export)

**Permission Tree:**
- Select All checkbox per module
- Individual permissions beneath
- Visual indication of selected count

---

## 11. Communication Module

### 11.1 Message List Screen

**Route:** `/message`  
**Purpose:** WhatsApp/SMS message threads

**Layout:**
```
┌──────────────────────────────┐
│  [App Bar] "Messages"        │
├──────────────────────────────┤
│  [Search Contacts]           │
├──────────────────────────────┤
│  [Contact Card 1]            │
│  👤 [Name]                   │
│  💬 Last message...          │
│  🕐 [Time]          [Badge]  │
├──────────────────────────────┤
│  [Contact Card 2]            │
└──────────────────────────────┘
```

**Contact Card:**
- Avatar with status indicator
- Name (H6)
- Last message preview (Body2, single line)
- Timestamp (Caption)
- Unread badge (if applicable)
- Tap: Navigate to conversation

**Empty State:**
- Message: "No conversations yet"
- Action: "Start New Conversation"

---

### 11.2 View Messages Screen

**Route:** `/message/view-messages/{mobile}`  
**Purpose:** Chat interface

**Layout:**
```
┌──────────────────────────────┐
│  [<] [Contact Name] [Call]   │
├──────────────────────────────┤
│                              │
│  [Message Bubble Received]   │
│  [Timestamp]                 │
│                              │
│         [Message Bubble Sent]│
│         [Timestamp] [✓✓]     │
│                              │
│  [Message Bubble Received]   │
│                              │
├──────────────────────────────┤
│  [+] [Input Field] [Send]    │
└──────────────────────────────┘
```

#### Components Specification

**1. App Bar**
- Back button
- Contact name and number
- Call icon button
- More menu (Clear chat, Block, etc.)

**2. Message Bubble (Received)**
- Background: Light grey (#F0F0F0)
- Alignment: Left
- Border Radius: 12dp (top-right, bottom corners)
- Padding: 12dp
- Max Width: 80% of screen
- Timestamp: Caption below bubble

**3. Message Bubble (Sent)**
- Background: Primary color light shade
- Alignment: Right
- Border Radius: 12dp (top-left, bottom corners)
- Padding: 12dp
- Max Width: 80% of screen
- Timestamp + Status: Caption below bubble
- Status Icons: ✓ Sent, ✓✓ Delivered, ✓✓ Read (blue)

**4. Message Input**
- **Layout:** Row with 3 components
  - Attachment button (+)
  - Text field (expandable, multi-line up to 4 lines)
  - Send button (icon)
- **Text Field:**
  - Placeholder: "Type a message"
  - Border: Outlined
  - Max Lines: 4
- **Send Button:**
  - Disabled when text empty
  - Primary color when active

**5. Template Message Option**
- Action: Opens template selector modal
- Templates grouped by category
- Variables replaced before sending

**6. Date Separators**
- Show date label between messages of different days
- Style: Center-aligned, caption, secondary text
- Example: "Yesterday", "Today", "Dec 24, 2024"

---

## 12. Miscellaneous Screens

### 12.1 My Profile Screen

**Route:** `/my-profile`  
**Purpose:** User settings and profile management

**Layout:**
```
┌──────────────────────────────┐
│  [App Bar] "My Profile"      │
├──────────────────────────────┤
│  [Profile Header Card]       │
│  [Large Avatar]              │
│  [Name] (H5)                 │
│  [Email]                     │
│  [Role Badge]                │
├──────────────────────────────┤
│  Personal Information        │
│  [Form Fields]               │
├──────────────────────────────┤
│  Change Password             │
│  [Form Fields]               │
├──────────────────────────────┤
│  [Save Changes Button]       │
└──────────────────────────────┘
```

**Sections:**

**1. Profile Header:**
- Large avatar (120dp) - tappable to change
- Name (from user data)
- Email (read-only)
- Role badge

**2. Personal Information Form:**
- First Name* (TextFormField)
- Last Name* (TextFormField)
- Email* (TextFormField, read-only)
- Phone Number (TextFormField)
- Profile Picture (Image picker button)

**3. Change Password (Expandable Section):**
- Current Password* (Password field)
- New Password* (Password field)
- Confirm New Password* (Password field)
- Password requirements indicator

**4. Notification Preferences:**
- Email Notifications (Switch)
- Push Notifications (Switch)
- SMS Notifications (Switch)

**5. Actions:**
- Save Changes (Primary button)
- Logout (Text button, secondary color)

---

### 12.2 Incomplete Leads Screen

**Route:** `/incomplete-leads`  
**Purpose:** Leads with missing information

**Filter Reasons:**
- Missing Phone Number
- Missing Email
- Missing Address
- Missing Source
- All Incomplete

**Table/List:**
- Similar to Lead List
- Highlight missing fields in red
- Quick action: "Complete Profile" → Opens edit form with focus on missing fields

**Bulk Actions:**
- Select multiple leads
- Delete selected
- Export to CSV

---

## 13. Global UI Components

### 13.1 Navigation

**Bottom Navigation (Mobile):**
- **Tabs:**
  1. Dashboard (Home icon)
  2. Leads (Lead icon)
  3. Orders (Order icon)
  4. Events (Calendar icon)
  5. More (Menu icon → opens drawer)
- **Style:**
  - Fixed at bottom
  - Height: 56dp
  - Selected: Primary color with label
  - Unselected: Grey with icon only
  - Badge: For notifications

**Navigation Drawer (Tablet/Desktop):**
- **Type:** Persistent drawer (tablet), permanent (desktop)
- **Width:** 256dp
- **Sections:**
  - User Profile (top)
  - Main Menu Items
  - Setup & Settings (bottom)
- **Menu Items:**
  - Dashboard
  - Leads
  - Clients
  - Orders
  - Events
  - Quotations
  - Messages
  - Reports
  - Divider
  - Setup (Expandable)
    - Lead Sources
    - Team Members
    - Event Types
    - Services
    - Packages
    - Notifications
  - Users & Roles (if permission)
  - Divider
  - My Profile
  - Logout

---

### 13.2 App Bar Variants

**Standard App Bar:**
- Height: 56dp (mobile), 64dp (desktop)
- Title: H6, Text Primary
- Background: Primary color or Surface
- Elevation: 0dp or 4dp
- Actions: Max 3 icons

**Contextual App Bar (Selection Mode):**
- Shows when items selected
- Background: Primary color dark shade
- Leading: Close icon
- Title: "N selected"
- Actions: Delete, Share, More

**Search App Bar:**
- Replaces standard app bar
- Leading: Back arrow
- Content: Search text field (full width)
- Trailing: Clear icon

---

### 13.3 Loading States

**Full Screen Loading:**
- Center-aligned circular progress indicator
- Optional: Loading message below
- Semi-transparent overlay

**Skeleton Screens:**
- Use for list items and cards
- Animated shimmer effect
- Maintain layout structure

**Inline Loading:**
- Small circular indicator
- Used in buttons or list items
- Replaces content temporarily

---

### 13.4 Error States

**Full Screen Error:**
- Icon (large, error color)
- Error message (H6)
- Subtitle (Body2)
- Retry button

**Inline Error:**
- Error icon + message
- Shown below forms or in snackbars

**Network Error:**
- Offline banner at top
- "You are offline" message
- Auto-dismiss when back online

---

### 13.5 Empty States

**Component:**
- Illustration (160dp x 160dp)
- Message (H6, centered)
- Subtitle (Body2, centered)
- Action button (if applicable)

**Variations:**
- No data yet (encouraging)
- No results (search-specific)
- Permission denied
- Offline state

---

### 13.6 Dialogs & Modals

**Confirmation Dialog:**
- Title (H6)
- Message (Body1)
- Actions: Dismiss, Confirm
- Destructive actions in red

**Bottom Sheet (Mobile):**
- Rounded top corners (16dp)
- Drag handle (optional)
- Max height: 90% screen
- Scrollable content

**Modal Dialog (Desktop):**
- Max width: 600dp
- Centered on screen
- Backdrop: Semi-transparent
- Close on backdrop click (optional)

---

### 13.7 Snackbars & Toasts

**Snackbar:**
- Position: Bottom (mobile), Bottom-left (desktop)
- Duration: 4 seconds
- Message: Body2
- Action: Optional button
- Variants:
  - Info: Default background
  - Success: Green background
  - Error: Red background
  - Warning: Orange background

---

### 13.8 Cards

**Standard Card:**
- Elevation: 1-2dp
- Border Radius: 8-12dp
- Padding: 16dp
- Margin: 8dp (between cards)

**Interactive Card:**
- Hover: Increase elevation to 4dp
- Ripple effect on tap
- Cursor: Pointer

---

### 13.9 Data Tables (Advanced)

**Features:**
- Sortable columns (arrow indicators)
- Filterable columns (filter icon)
- Searchable (global search)
- Selectable rows (checkboxes)
- Pagination controls
- Column visibility toggle
- Export options (CSV, Excel, PDF)
- Row actions menu
- Inline editing (optional)

**Responsive Behavior:**
- Mobile: Convert to card list
- Tablet: Horizontal scroll
- Desktop: Full table

---

### 13.10 Forms Best Practices

**Layout:**
- Single column on mobile
- Two columns on desktop (if appropriate)
- Related fields grouped
- Clear sections with dividers

**Validation:**
- Real-time validation (after first blur)
- Error messages below fields
- Success indicators (checkmark)
- Required fields marked with *

**Input Types:**
- Text: Standard text field
- Email: Email keyboard
- Phone: Numeric keyboard with formatting
- Date: Date picker dialog
- Time: Time picker dialog
- Dropdown: Select with search
- Multi-select: Checkbox list or chip input
- Rich Text: Editor with formatting toolbar

---

## 14. Accessibility Requirements

### 14.1 General Guidelines
- Minimum touch target: 48dp x 48dp
- Sufficient color contrast (WCAG AA)
- Screen reader support (semantic labels)
- Keyboard navigation (desktop)
- Focus indicators visible
- Text scalability (up to 200%)

### 14.2 Implementation
- Use semantic widgets
- Provide alternative text for images
- Ensure logical tab order
- Support platform accessibility features
- Test with TalkBack (Android) and VoiceOver (iOS)

---

## 15. Performance Considerations

### 15.1 Image Optimization
- Use cached network images
- Implement lazy loading
- Provide placeholders
- Support offline caching

### 15.2 List Performance
- Use ListView.builder for long lists
- Implement pagination
- Virtual scrolling
- Optimize item builders

### 15.3 State Management
- Use appropriate state solution (Provider, Riverpod, Bloc)
- Minimize rebuilds
- Implement proper disposal
- Cache API responses

---

## 16. Platform-Specific Considerations

### 16.1 Mobile (iOS & Android)
- Respect safe areas
- Platform-specific navigation patterns
- Native feel (Cupertino for iOS, Material for Android)
- Handle keyboard properly
- Support gestures (swipe to go back)
- Deep linking support

### 16.2 Web
- Responsive breakpoints
- SEO-friendly routing
- Browser history support
- Proper scroll behavior
- Keyboard shortcuts
- Print-friendly views

---

## 17. Animation & Transitions

### 17.1 Page Transitions
- Material page route transitions
- Fade transitions for modals
- Slide transitions for bottom sheets
- Hero animations for images

### 17.2 Micro-interactions
- Button press feedback
- Loading animations
- Success/error animations
- Skeleton screen transitions
- Smooth scroll animations

---

## 18. Testing Recommendations

### 18.1 Test Coverage
- Widget tests for UI components
- Integration tests for workflows
- Golden tests for visual regression
- Accessibility tests

### 18.2 Device Testing
- Various screen sizes
- Different OS versions
- Different browsers (web)
- Network conditions (offline, slow)

---

## 19. Design Handoff Checklist

- [ ] All screen layouts documented
- [ ] Component specifications provided
- [ ] Color palette defined
- [ ] Typography scale specified
- [ ] Spacing system defined
- [ ] Icon set provided
- [ ] Illustration assets provided
- [ ] Animation specifications
- [ ] Interaction patterns defined
- [ ] Error states documented
- [ ] Loading states documented
- [ ] Empty states documented
- [ ] Accessibility requirements listed
- [ ] Responsive breakpoints defined
- [ ] Platform-specific variations noted

---

## 20. Additional Notes

### 20.1 Clarifications Needed
1. **Dashboard "Total Clients":** Verify if this should show clients or team members (variable name mismatch)
2. **Order vs Event:** Clarify relationship between orders and events (are they the same?)
3. **Payment Flow:** Detail payment recording workflow
4. **Document Upload:** Specify allowed file types and size limits
5. **Notification System:** Define notification triggers and templates
6. **Reports Module:** Not detailed in original spec - needs requirements

### 20.2 Future Enhancements
- Dark mode support
- Multi-language support
- Advanced reporting
- Analytics dashboard
- Calendar synchronization
- Email integration
- Payment gateway integration
- Cloud storage integration

---

## Appendix A: Typography Scale

- **H1:** 96sp, Light
- **H2:** 60sp, Light
- **H3:** 48sp, Regular
- **H4:** 34sp, Regular
- **H5:** 24sp, Regular
- **H6:** 20sp, Medium
- **Subtitle1:** 16sp, Regular
- **Subtitle2:** 14sp, Medium
- **Body1:** 16sp, Regular
- **Body2:** 14sp, Regular
- **Button:** 14sp, Medium, Uppercase
- **Caption:** 12sp, Regular
- **Overline:** 10sp, Regular, Uppercase

---

## Appendix B: Icon Library

Recommended: Material Icons or custom icon set
- Ensure consistent style
- Provide 24dp and 48dp sizes
- Include filled and outlined variants
- Export as SVG for scalability

---

## Appendix C: Sample Color Values

```dart
// Primary Colors
final primaryColor = Color(0xFF1976D2);
final primaryLight = Color(0xFF63A4FF);
final primaryDark = Color(0xFF004BA0);

// Secondary Colors
final secondaryColor = Color(0xFFFFA726);
final secondaryLight = Color(0xFFFFD95B);
final secondaryDark = Color(0xFFC77800);

// Status Colors
final successColor = Color(0xFF388E3C);
final errorColor = Color(0xFFD32F2F);
final warningColor = Color(0xFFF57C00);
final infoColor = Color(0xFF1976D2);

// Neutral Colors
final backgroundColor = Color(0xFFF5F5F5);
final surfaceColor = Color(0xFFFFFFFF);
final textPrimary = Color(0xFF212121);
final textSecondary = Color(0xFF757575);
final dividerColor = Color(0xFFBDBDBD);
```

---

**End of Document**

This comprehensive Flutter UI Design Specification provides your development team with detailed information about every screen, component, interaction, and design pattern needed to build the event management application. Please review and provide feedback on any areas requiring clarification or modification.