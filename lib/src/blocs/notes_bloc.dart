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

  Stream<List<NoteModel>> get notesControler => _notesController.stream;
  Stream<bool> get resultControler => _resultController.stream;

  void createNote(NoteModel model) async {
    final res = await _repoProvider.createNote(model);
    _resultController.sink.add((res == 1));
  }
}
