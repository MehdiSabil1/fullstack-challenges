def coach_answer(your_message)
  if your_message == "I am going to work right now!"
    return ""
  elsif your_message.end_with?("?")
    return "Silly question, get dressed and go to work!"
  else
    return "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  going_to_work = ["I am going to work right now!", "I AM GOING TO WORK RIGHT NOW!"]
  return "" if going_to_work.include?(your_message)

  prefix = your_message == your_message.upcase ? "I can feel your motivation! " : ""

  if your_message.end_with?("?")
    "#{prefix}Silly question, get dressed and go to work!"
  else
    "#{prefix}I don't care, get dressed and go to work!"
  end
end
