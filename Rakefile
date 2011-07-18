task :default => :update

desc "Update bundles"
task :update do
    # Pull each submodule
	sh %{git submodule foreach git pull origin master}

    # Check if bundle directory was updated
	sh %{git diff --quiet --ignore-submodules bundle} do |ok, res|
        if ! ok
            sh %{git commit --quiet --message "Updated bundles" bundle}
        end
    end

    # Generate help tags
    # http://stackoverflow.com/q/4180590/4180883#4180883
    sh %{vim -c 'call pathogen#helptags()|q'}
end
