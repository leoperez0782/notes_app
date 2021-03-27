import 'package:notes_app/src/models/note_model.dart';
import 'package:notes_app/src/providers/repository_provider.dart';
import 'package:rxdart/rxdart.dart';

class NotesBloc {
  final _notesController = BehaviorSubject<List<NoteModel>>();
  final _resultController = BehaviorSubject<bool>();
  final _repoProvider = RepositoryProvider.repoProvider;
  void dispose() {
    _notesController?.close();
    _resultController?.close();
  }

  Stream<List<NoteModel>> get notesStream => _notesController.stream;
  Stream<bool> get resultStream => _resultController.stream;

  void createNote(NoteModel model) async {
    final res = await _repoProvider.createNote(model);
    _resultController.sink.add((res > 0));
  }

  void loadNotes() async {
    final res = await _repoProvider.findAllNotes();
    _notesController.sink.add(res);
  }

  Future<int> deleteNote(NoteModel model) async {
    return await _repoProvider.deleteNote(model.id);
  }

  Future<int> updateNote(NoteModel note) async {
    return await _repoProvider.updateNote(note);
  }
}
