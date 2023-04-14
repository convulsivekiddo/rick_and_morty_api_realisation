// import 'package:freezed_annotation/freezed_annotation.dart';

part of 'package:rick_and_morty_api/bloc/character_block.dart';


@freezed
class CharacterState with _$CharacterState{
  const factory CharacterState.loading() = CharacterStateLoading;
  const factory CharacterState.loaded({required Character characterLoaded}) = CharacterStateLoaded;
  const factory CharacterState.error() = CharacterStateError;
}