package kingnote.main;

import kingnote.model.Reminder;
import kingnote.model.Category;
import kingnote.model.Note;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class KingNote {

    private List<Note> notes = new ArrayList<>();
    private ArrayList<Note> trash = new ArrayList<>();

    // BEGIN - Entity Note
    public void addNote(String title, String text) {
        Note newNote = new Note(title, text);
        getNotes().add(newNote);
    }

    public void editNote(String id, String title, String text) {
        Note returnSearch = searchTrash(id);
        if (returnSearch != null) {
            returnSearch.setText(text);
            if (title.length() > 0) {
                returnSearch.setTitle(title);
            } else {
                returnSearch.setTitle(text.substring(0, 20));
            }
        }
    }

    public void removeNote(String id) {
        Note returnSearch = searchNote(id);
        if (returnSearch != null) {
            getTrash().add(returnSearch);
            getNotes().remove(returnSearch);
        }
    }

    private Note searchNote(String id) {
        for (Note note : getNotes()) {
            if (note.getId().equals(id)) {
                return note;
            }
        }
        return null;
    }
    // END - Entity Note

    // BEGIN - Entity Trash
    public void removeTrash(String id) {
        Note returnSearch = searchTrash(id);
        if (returnSearch != null) {
            getTrash().remove(returnSearch);
        }
    }

    private Note searchTrash(String id) {
        for (Note note : getTrash()) {
            if (note.getId().equals(id)) {
                return note;
            }
        }
        return null;
    }
    // END - Entity Trash

    // BEGIN - Entity Reminder
    public void addReminder(String idNote, String title, Date data) {
        Reminder newReminder = new Reminder(title, data);
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            returnSearch.getReminders().add(newReminder);
        }
    }

    public void editReminder(String idNote, String idReminder, String title, Date data) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Reminder returnSearchReminder = searchReminder(returnSearchNote, idReminder);
            if (returnSearchReminder != null) {
                returnSearchReminder.setData(data);
                returnSearchReminder.setTitle(title);
            }
        }
    }

    public void removeReminder(String idNote, String idReminder) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Reminder returnSearchReminder = searchReminder(returnSearchNote, idReminder);
            if (returnSearchReminder != null) {
                returnSearchNote.getReminders().remove(returnSearchReminder);
            }
        }
    }

    private Reminder searchReminder(Note note, String id) {
        for (Reminder reminder : note.getReminders()) {
            if (reminder.getId().equals(id)) {
                return reminder;
            }
        }
        return null;
    }
    // END - Entity Reminder

    // BEGIN - Entity Category
    public void addCategory(String idNote, String name, String color) {
        Category newCategory = new Category(name, color);
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            returnSearch.getCategories().add(newCategory);
        }
    }

    public void editCategory(String idNote, String idCategory, String name, String color) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Category returnSearchCategory = searchCategory(returnSearchNote, idCategory);
            if (returnSearchCategory != null) {
                returnSearchCategory.setColor(color);
                returnSearchCategory.setName(name);
            }
        }
    }

    public void removeCategory(String idNote, String idCategory) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Category returnSearchCategory = searchCategory(returnSearchNote, idCategory);
            if (returnSearchCategory != null) {
                returnSearchNote.getCategories().remove(returnSearchCategory);
            }
        }
    }

    private Category searchCategory(Note note, String id) {
        for (Category Category : note.getCategories()) {
            if (Category.getId().equals(id)) {
                return Category;
            }
        }
        return null;
    }
    // END - Entity Category

    /**
     * @return the notes
     */
    public List<Note> getNotes() {
        return notes;
    }

    /**
     * @param notes the notes to set
     */
    public void setNotes(ArrayList<Note> notes) {
        this.notes = notes;
    }

    /**
     * @return the trash
     */
    public ArrayList<Note> getTrash() {
        return trash;
    }

    /**
     * @param trash the trash to set
     */
    public void setTrash(ArrayList<Note> trash) {
        this.trash = trash;
    }
}
