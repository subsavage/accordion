## Overview
A Flutter app displaying a scrollable list of collection cards with product images. Only one collection can be expanded at a time with smooth animations.

<img width="468" height="817" alt="Image" src="https://github.com/user-attachments/assets/e9a03161-e2aa-4762-bde9-f6bac7e597bc" />

## Features
✅ Scrollable collection cards  
✅ Single-expansion accordion (only one open at a time)  
✅ Horizontal image row with responsive layout  
✅ +N overlay for hidden images  
✅ Smooth 300ms animations  
✅ Rounded corners & elevation styling  
✅ Network images with error handling  

## Project Structure
```
lib/
├── main.dart                      # App entry point
├── screens/
│   └── homepage.dart              # Collection cards & accordion logic
└── widgets/
    └── image_row_overflow.dart    # Responsive image row widget
```

## How It Works
The app uses **parent state management** to enforce single expansion:
- `expandedIndex` tracks which collection is open (null if none)
- Clicking a card sets `expandedIndex` to that card's index
- Clicking an open card sets `expandedIndex` to null
- `AnimatedCrossFade` provides smooth transitions (300ms)
- Result: **Only one card can be expanded at a time**



**Status**: ✅ Ready for Submission
