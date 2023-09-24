module Middleman
  module Cli
    class ClearBuild < Thor
      include Thor::Actions

      def clear_build
        build_dir = Middleman::Application.server.inst.build_dir
        remove_dir(build_dir)
        empty_directory(build_dir)
        puts "Build directory #{build_dir} cleared."
      end
    end

    Base.register(ClearBuild, 'clear_build', 'clear_build', 'Clear the build directory')
  end
end
