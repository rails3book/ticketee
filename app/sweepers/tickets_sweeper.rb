class TicketsSweeper < ActionController::Caching::Sweeper
  observe Ticket
  def after_create(ticket)
    expire_fragments_for_project(ticket.project)
  end

  def after_update(ticket)
    expire_fragments_for_project(ticket.project)
  end

  def after_destroy(ticket)
    expire_fragments_for_project(ticket.project)
  end

  private

    def expire_fragments_for_project(project)
       expire_fragment(/projects\/#{project.id}\/.*?/)
    end
end