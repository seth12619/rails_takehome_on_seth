module Task5Concern
  extend ActiveSupport::Concern
  
  included do
    def has_simple_notes?
      self.class.not_reminders_or_todos.any?
    end

    def has_to_do_notes?
      self.class.to_dos.any?
    end

    def has_reminder_notes?
      self.class.reminders.any?
    end
  end
end