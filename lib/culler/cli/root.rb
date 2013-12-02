class Culler::CLI::Root < Thor

  desc "add NAME /path/to/root", "Add a new root with the given name and path"
  def add( name, path )
  end

  desc "remove NAME", "Remove the named root and all associated files"
  def remove( name )
  end

  desc "enable NAME", "Enable the named root"
  def enable( name )
  end

  desc "disable NAME", "Disable the named root"
  def disable( name )
  end

end
