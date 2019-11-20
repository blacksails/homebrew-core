class Kubebuilder < Formula
  desc "SDK for building Kubernetes APIs using CRDs"
  homepage "https://kubebuilder.io/"
  url "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v2.2.0/kubebuilder_2.2.0_darwin_amd64.tar.gz"
  sha256 "5ccb9803d391e819b606b0c702610093619ad08e429ae34401b3e4d448dd2553"
  version "2.2.0"
  
  def install
    bin.install "bin/kubebuilder"
    libexec.install "bin/etcd"
    libexec.install "bin/kube-apiserver"
    libexec.install "bin/kubectl"
  end

  def caveats
    <<~EOS
      In order for kubebuilder to run test environments you will need to set
      KUBEBUILDER_ASSETS to the path of the kubebuilder binary assets.
      export KUBEBUILDER_ASSETS=/usr/local/opt/kubebuilder/libexec
    EOS
  end

  test do
    system "#{bin}/kubebuilder", "init",
      "--repo=github.com/example/example-repo", "--domain=example.com",
      "--license=apache2", "--owner='The Example authors'", "--fetch-deps=false"
  end
end
