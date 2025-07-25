// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import '../models/category_model.dart';
import '../models/task_model.dart';



export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
    id: const obx_int.IdUid(1, 1008259779260114945),
    name: 'Category',
    lastPropertyId: const obx_int.IdUid(2, 2808633378337115644),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 1019386816257875312),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 2808633378337115644),
        name: 'name',
        type: 9,
        flags: 0,
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[
      obx_int.ModelBacklink(
        name: 'tasks',
        srcEntity: 'Task',
        srcField: 'category',
      ),
    ],
  ),
  obx_int.ModelEntity(
    id: const obx_int.IdUid(2, 5470357807764043975),
    name: 'Task',
    lastPropertyId: const obx_int.IdUid(4, 4561556014586439351),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 3754981017917978279),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 7625055720454843687),
        name: 'name',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(3, 6930450010367594583),
        name: 'isCompleted',
        type: 1,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(4, 4561556014586439351),
        name: 'categoryId',
        type: 11,
        flags: 520,
        indexId: const obx_int.IdUid(1, 5506545453093020527),
        relationTarget: 'Category',
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[],
  ),
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore({
  String? directory,
  int? maxDBSizeInKB,
  int? maxDataSizeInKB,
  int? fileMode,
  int? maxReaders,
  bool queriesCaseSensitiveDefault = true,
  String? macosApplicationGroup,
}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(
    getObjectBoxModel(),
    directory: directory ?? (await defaultStoreDirectory()).path,
    maxDBSizeInKB: maxDBSizeInKB,
    maxDataSizeInKB: maxDataSizeInKB,
    fileMode: fileMode,
    maxReaders: maxReaders,
    queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
    macosApplicationGroup: macosApplicationGroup,
  );
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
    entities: _entities,
    lastEntityId: const obx_int.IdUid(2, 5470357807764043975),
    lastIndexId: const obx_int.IdUid(1, 5506545453093020527),
    lastRelationId: const obx_int.IdUid(0, 0),
    lastSequenceId: const obx_int.IdUid(0, 0),
    retiredEntityUids: const [],
    retiredIndexUids: const [],
    retiredPropertyUids: const [],
    retiredRelationUids: const [],
    modelVersion: 5,
    modelVersionParserMinimum: 5,
    version: 1,
  );

  final bindings = <Type, obx_int.EntityDefinition>{
    Category: obx_int.EntityDefinition<Category>(
      model: _entities[0],
      toOneRelations: (Category object) => [],
      toManyRelations: (Category object) => {
        obx_int.RelInfo<Task>.toOneBacklink(
          4,
          object.id,
          (Task srcObject) => srcObject.category,
        ): object.tasks,
      },
      getId: (Category object) => object.id,
      setId: (Category object, int id) {
        object.id = id;
      },
      objectToFB: (Category object, fb.Builder fbb) {
        final nameOffset = fbb.writeString(object.name);
        fbb.startTable(3);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, nameOffset);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final idParam = const fb.Int64Reader().vTableGet(
          buffer,
          rootOffset,
          4,
          0,
        );
        final nameParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 6, '');
        final object = Category(id: idParam, name: nameParam);
        obx_int.InternalToManyAccess.setRelInfo<Category>(
          object.tasks,
          store,
          obx_int.RelInfo<Task>.toOneBacklink(
            4,
            object.id,
            (Task srcObject) => srcObject.category,
          ),
        );
        return object;
      },
    ),
    Task: obx_int.EntityDefinition<Task>(
      model: _entities[1],
      toOneRelations: (Task object) => [object.category],
      toManyRelations: (Task object) => {},
      getId: (Task object) => object.id,
      setId: (Task object, int id) {
        object.id = id;
      },
      objectToFB: (Task object, fb.Builder fbb) {
        final nameOffset = fbb.writeString(object.name);
        fbb.startTable(5);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, nameOffset);
        fbb.addBool(2, object.isCompleted);
        fbb.addInt64(3, object.category.targetId);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final idParam = const fb.Int64Reader().vTableGet(
          buffer,
          rootOffset,
          4,
          0,
        );
        final nameParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 6, '');
        final isCompletedParam = const fb.BoolReader().vTableGet(
          buffer,
          rootOffset,
          8,
          false,
        );
        final object = Task(
          id: idParam,
          name: nameParam,
          isCompleted: isCompletedParam,
        );
        object.category.targetId = const fb.Int64Reader().vTableGet(
          buffer,
          rootOffset,
          10,
          0,
        );
        object.category.attach(store);
        return object;
      },
    ),
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Category] entity fields to define ObjectBox queries.
class Category_ {
  /// See [Category.id].
  static final id = obx.QueryIntegerProperty<Category>(
    _entities[0].properties[0],
  );

  /// See [Category.name].
  static final name = obx.QueryStringProperty<Category>(
    _entities[0].properties[1],
  );

  /// see [Category.tasks]
  static final tasks = obx.QueryBacklinkToMany<Task, Category>(Task_.category);
}

/// [Task] entity fields to define ObjectBox queries.
class Task_ {
  /// See [Task.id].
  static final id = obx.QueryIntegerProperty<Task>(_entities[1].properties[0]);

  /// See [Task.name].
  static final name = obx.QueryStringProperty<Task>(_entities[1].properties[1]);

  /// See [Task.isCompleted].
  static final isCompleted = obx.QueryBooleanProperty<Task>(
    _entities[1].properties[2],
  );

  /// See [Task.category].
  static final category = obx.QueryRelationToOne<Task, Category>(
    _entities[1].properties[3],
  );
}
