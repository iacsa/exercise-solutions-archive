module GradeSchool
  exposing ( empty
           , addStudent
           , studentsInGrade
           , allStudents
           )

import Dict


type alias GradeSchool = Dict.Dict Int (List String)


empty : GradeSchool
empty = Dict.empty



addStudent : Int -> String -> GradeSchool -> GradeSchool
addStudent grade student =
  Dict.update grade (Maybe.withDefault [] >> (::) student >> List.sort >> Just)


studentsInGrade : Int -> GradeSchool -> List String
studentsInGrade grade school =
  school
    |> Dict.get grade
    |> Maybe.withDefault []


allStudents : GradeSchool -> List (Int, List String)
allStudents =
  Dict.toList
