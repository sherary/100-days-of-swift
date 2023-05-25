### Main differences between UITextView and UITextField:

#### 1. Text Input and Editing: 
##### - UITextView: 
    * Designed for multiline text input and editing. 
    * Allows users to enter and edit large amounts of text.
##### - UITextView: 
    * Commonly used for shorter inputs like usernames, passwords, or search queries.

#### 2. Text Display and Scrolling: 
##### - UITextView:
    * Can display and scroll large amounts of text beyond the visible frame.
    providing a more expansive view for reading and editing. 
##### - UITextField:
    * Typically displays only a single line of text. 
    * Does not support scrolling by default.

#### 3. Text Formatting and Styling: 
##### - UITextView:
    * Supports rich text editing.
    * Allowing users to format text with different font styles, sizes, colors, and attributes. 
##### - UITextField:
    * By default, supports only plain text input without extensive text formatting options.

#### 4. Placeholder Text: 
##### - UITextView:
    * Does not have a placeholder property. (However can be reenacted with other element).
##### - UITextField:
    * Has a built*in placeholder property to display a hint or example text when the field is empty. 

#### 5. Delegate Methods: 
##### - Both UITextView and UITextField:
    * Have delegate protocols that respond to text input events and implement custom behaviors. 
    (However, the specific delegate methods differ between the two classes based on their respective functionality.)

#### 6. Auto Layout Constraints: 
##### - UITextView: 
    * Automatically handles its own height based on the content size when setting up constraints.
##### - UITextField:
    * Relies on explicit height constraints. 
 This difference is due to the multiline nature of UITextView compared to the single*line nature of UITextField.