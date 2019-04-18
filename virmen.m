function virmen
% VIRMEN   Virtual Reality Matlab Engine.

% If ViRMEn is already open, make the figure visible
fig = findall(0,'name','ViRMEn');
if isempty(fig)
    % Call the ViRMEn GUI
    virmenGui;
else
    set(fig,'visible','on');
    set(fig,'Pointer','arrow');
end

% *************************************************************************
% Copyright 2013, Princeton University.  All rights reserved.
% 
% By using this software the USER indicates that he or she has read,
% understood and will comply with the following:
% 
%  --- Princeton University hereby grants USER nonexclusive permission to
% use, copy and/or modify this software for internal, noncommercial,
% research purposes only. Any distribution, including publication or
% commercial sale or license, of this software, copies of the software, its
% associated documentation and/or modifications of either is strictly
% prohibited without the prior consent of Princeton University. Title to
% copyright to this software and its associated documentation shall at all
% times remain with Princeton University.  Appropriate copyright notice
% shall be placed on all software copies, and a complete copy of this
% notice shall be included in all copies of the associated documentation.
% No right is granted to use in advertising, publicity or otherwise any
% trademark, service mark, or the name of Princeton University. 
% 
%  --- This software and any associated documentation is provided "as is" 
% 
% PRINCETON UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
% IMPLIED, INCLUDING THOSE OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR
% PURPOSE, OR THAT  USE OF THE SOFTWARE, MODIFICATIONS, OR ASSOCIATED
% DOCUMENTATION WILL NOT INFRINGE ANY PATENTS, COPYRIGHTS, TRADEMARKS OR
% OTHER INTELLECTUAL PROPERTY RIGHTS OF A THIRD PARTY. 
% 
% Princeton University shall not be liable under any circumstances for any
% direct, indirect, special, incidental, or consequential damages with
% respect to any claim by USER or any third party on account of or arising
% from the use, or inability to use, this software or its associated
% documentation, even if Princeton University has been advised of the
% possibility of those damages.
% *************************************************************************