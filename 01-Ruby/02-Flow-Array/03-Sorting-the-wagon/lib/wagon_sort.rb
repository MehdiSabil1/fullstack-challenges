def wagon_sort(students)
  # TODO: return (not print!) a copy of students, sorted alphabetically
  #   should be case-insensitive when sorting (FAILED - 1)
  students.sort_by(&:downcase)
end
