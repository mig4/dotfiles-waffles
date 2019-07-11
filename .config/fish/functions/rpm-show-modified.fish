function rpm-show-modified
  for pkg in (rpm -qa)
    sudo rpm --verify --nomtime --noghost $pkg \
      | sed -r -e \
        "1i "(set_color brcyan)"# "(set_color bryellow)"$pkg"(set_color normal)
  end
end
