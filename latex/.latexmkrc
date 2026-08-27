$pdf_mode = 5;
$out_dir = "build";
# sub asy {return system("asy -o '$_[0]' '$_[0]'");}
# add_cus_dep("asy","eps",0,"asy");
# add_cus_dep("asy","pdf",0,"asy");
# add_cus_dep("asy","tex",0,"asy");
# push @generated_exts, "pre", "%R-[0-9]*.pdf", "%R-[0-9]*.prc", "%R-[0-9]*.tex", "%R-[0-9]*.out", "%R-[0-9]*.pbsdat", "%R.pbsdat", "%R-[0-9]*.eps", "%R-*.asy"

# ---------- 原有部分（保留） ----------
sub asy {
	my $base = $_[0];
	our $Pdest;
	my $dir = $out_dir || '.';           # 如果设置了 out_dir 就用它，否则当前目录
	$dir = $aux_dir if $aux_dir;         # 如果单独设置了 aux_dir，中间文件优先放那里（可选）
	mkdir $dir unless -d $dir;
	my $dest = $$Pdest;
	my ($ext) = $dest =~ /\.([^.]+)$/;
	$ext = 'pdf' unless defined $ext && length $ext;
	my $format = ($ext eq 'eps' || $ext eq 'tex') ? $ext : 'pdf';
	$$Pdest = "$dir/$base.$ext";
	return system("asy -f $format -o '$dir/$base' '$base.asy'");
}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");

# ---------- 新增：tsqx -> asy（兼容 out_dir） ----------
add_cus_dep('tsqx', 'asy', 0, 'tsqx2asy');
sub tsqx2asy {
	my $base = $_[0];
	our $Pdest;
	my $dir = $out_dir || '.';
	$dir = $aux_dir if $aux_dir;
	mkdir $dir unless -d $dir;
	$$Pdest = "$dir/$base.asy";
	return system("tsqx -p \"$base.tsqx\" > \"$dir/$base.asy\"");
}

push @generated_exts, "pre", "%R-*.pdf", "%R-*.prc", "%R-*.tex", "%R-*.out", "%R-*.pbsdat", "%R.pbsdat", "%R-*.eps", "%R-*.asy";

push @file_not_found, '^.*\.tsqx$', '^.*\.asy$';

# 清理时额外删除与主文件同名的 .asy
$clean_ext .= ' %R-*.asy';
