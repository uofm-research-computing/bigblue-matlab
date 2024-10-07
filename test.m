function test(x)
	if isstring(x)
		nCPU=str2num(x);
	elseif isnumeric(x)
		nCPU=x;
	else
		nCPU=1;
	end
	disp(['Using ', num2str(nCPU),' CPUs.']);
	mypool=parpool(nCPU);
	randMat=rand(1000);
	% disp(randMat);
	tic
	parfor i=1:nCPU, c(:,i) = eig(randMat), end;
	toc
	delete(mypool);
end
