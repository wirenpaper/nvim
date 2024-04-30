:set notimeout

tnoremap <a-l> <c-\><c-n>

inoremap ' =
cnoremap ' =
tnoremap ' =
nnoremap r' r=
xnoremap r' r=
nnoremap ,s' <cmd>HopChar1<CR>=
vnoremap ,s' <cmd>HopChar1<CR>=

tnoremap <C-h> <backspace>

snoremap <A-j> <
noremap <A-j> <
inoremap <A-j> <
cnoremap <A-j> <
tnoremap <A-j> <
nnoremap r<A-j> r<
xnoremap r<A-j> r<
nnoremap ,s<A-j> <cmd>HopChar1<CR><
vnoremap ,s<A-j> <cmd>HopChar1<CR><
nnoremap dt<A-j> dt<
nnoremap dT<A-j> dT<

snoremap < {
inoremap < {
cnoremap < {
tnoremap < {
nnoremap r< r{
xnoremap r< r{
nnoremap s< ,s{
nnoremap ,s< <cmd>HopChar1<CR>{
vnoremap ,s< <cmd>HopChar1<CR>{

snoremap <A-k> >
noremap <A-k> >
inoremap <A-k> >
cnoremap <A-k> >
tnoremap <A-k> >
nnoremap r<A-k> r>
xnoremap r<A-k> r>
nnoremap ,s<A-k> <cmd>HopChar1<CR>>
vnoremap ,s<A-k> <cmd>HopChar1<CR>>
nnoremap dt<A-k> dt>
nnoremap dT<A-k> dT>

snoremap > }
inoremap > }
cnoremap > }
tnoremap > }
nnoremap r> r}
xnoremap r> r}
nnoremap ,s> <cmd>HopChar1<CR>}
vnoremap ,s> <cmd>HopChar1<CR>}
nnoremap dt> dt}
nnoremap dT> dT}

snoremap <C-k> *
nnoremap <C-k> *
inoremap <C-k> *
cnoremap <C-k> *
tnoremap <C-k> *
nnoremap r<C-k> r*
xnoremap r<C-k> r*
map ,s<C-k> ,s*
nnoremap ,s<C-k> <cmd>HopChar1<CR>*
vnoremap ,s<C-k> <cmd>HopChar1<CR>*
nnoremap dt<C-k> dt*
nnoremap dT<C-k> dT*

snoremap <C-A-l> +
inoremap <C-A-l> +
cnoremap <C-A-l> +
tnoremap <C-A-l> +
nnoremap r<C-A-l> r+
xnoremap r<C-A-l> r+
nnoremap ,s<C-A-l> <cmd>HopChar1<CR>+
vnoremap ,s<C-A-l> <cmd>HopChar1<CR>+
nnoremap dt<C-A-l> dt+
nnoremap dT<C-A-l> dT+

snoremap <C-l> _
inoremap <C-l> _
cnoremap <C-l> _
tnoremap <C-l> _
nnoremap r<C-l> r_
xnoremap r<C-l> r_
nnoremap ,s<C-l> <cmd>HopChar1<CR>_
vnoremap ,s<C-l> <cmd>HopChar1<CR>_
nnoremap dt<C-l> dt_
nnoremap dT<C-l> dT_

"inoremap <C-A-j> (
snoremap <A-CR> (
inoremap <A-CR> (
cnoremap <A-CR> (
tnoremap <A-CR> (
nnoremap r<A-CR> r(
xnoremap r<A-CR> r(
map ,s<A-CR> ,s(
nnoremap ,s<A-CR> <cmd>HopChar1<CR>(
vnoremap ,s<A-CR> <cmd>HopChar1<CR>(
nnoremap dt<A-CR> dt(
nnoremap dT<A-CR> dT(

snoremap <C-A-k> )
inoremap <C-A-k> )
cnoremap <C-A-k> )
tnoremap <C-A-k> )
nnoremap r<C-A-k> r)
xnoremap r<C-A-k> r)
nnoremap ,s<C-A-k> <cmd>HopChar1<CR>)
vnoremap ,s<C-A-k> <cmd>HopChar1<CR>)
nnoremap dt<C-A-k> dt)
nnoremap dT<C-A-k> dT)

snoremap <C-A-i> [
inoremap <C-A-i> [
cnoremap <C-A-i> [
tnoremap <C-A-i> [
nnoremap r<C-A-i> r[
xnoremap r<C-A-i> r[
nnoremap ,s<C-A-i> <cmd>HopChar1<CR>[
vnoremap ,s<C-A-i> <cmd>HopChar1<CR>[
nnoremap dt<C-A-i> dt[
nnoremap dT<C-A-i> dT[

snoremap <C-A-o> ]
inoremap <C-A-o> ]
cnoremap <C-A-o> ]
tnoremap <C-A-o> ]
nnoremap r<C-A-o> r]
xnoremap r<C-A-o> r]
nnoremap ,s<C-A-o> <cmd>HopChar1<CR>]
vnoremap ,s<C-A-o> <cmd>HopChar1<CR>]
nnoremap dt<C-A-o> dt]
nnoremap dT<C-A-o> dT]

snoremap <C-q> !
inoremap <C-q> !
cnoremap <C-q> !
tnoremap <C-q> !
nnoremap r<C-q> r!
xnoremap r<C-q> r!
nnoremap ,s<C-q> <cmd>HopChar1<CR>!
vnoremap ,s<C-q> <cmd>HopChar1<CR>!
nnoremap dt<C-q> dt!
nnoremap dT<C-q> dT!

snoremap <C-e> &
inoremap <C-e> &
cnoremap <C-e> &
tnoremap <C-e> &
nnoremap r<C-e> r&
xnoremap r<C-e> r&
nnoremap ,s<C-e> <cmd>HopChar1<CR>&
vnoremap ,s<C-e> <cmd>HopChar1<CR>&
nnoremap dt<C-e> dt&
nnoremap dT<C-e> dT&

snoremap <C-d> %
inoremap <C-d> %
cnoremap <C-d> %
tnoremap <C-d> %
nnoremap r<C-d> r%
xnoremap r<C-d> r%
nnoremap ,s<C-d> <cmd>HopChar1<CR>%
vnoremap ,s<C-d> <cmd>HopChar1<CR>%
nnoremap dt<C-d> dt%
nnoremap dT<C-d> dT%

inoremap " >
tnoremap " >

snoremap <C-A-u> '
inoremap <C-A-u> '
cnoremap <C-A-u> '
tnoremap <C-A-u> '
nnoremap r<C-A-u> r'
xnoremap r<C-A-u> r'
nnoremap ,s<C-A-u> <cmd>HopChar1<CR>'
vnoremap ,s<C-A-u> <cmd>HopChar1<CR>'
nnoremap dt<C-A-u> dt'
nnoremap dT<C-A-u> dT'

snoremap <C-o> "
inoremap <C-o> "
cnoremap <C-o> "
tnoremap <C-o> "
nnoremap r<C-o> r"
xnoremap r<C-o> r"
map ,s<C-o> ,s"
nnoremap ,s<C-o> <cmd>HopChar1<CR>"
vnoremap ,s<C-o> <cmd>HopChar1<CR>"
nnoremap dt<C-o> dt"
nnoremap dT<C-o> dT"

nnoremap m 0
vnoremap m 0
"tnoremap m 0
nnoremap . $
vnoremap . $
"tnoremap . $

inoremap ( #
cnoremap ( #
tnoremap ( #
nnoremap r( r#
xnoremap r( r#
map ,s( ,s#
nnoremap ,s( <cmd>HopChar1<CR>#
vnoremap ,s( <cmd>HopChar1<CR>#
nnoremap dt( dt#
nnoremap dT( dT#

nnoremap d. d$
nnoremap dm d0

" numbers
inoremap 1 6
cnoremap 1 6
tnoremap 1 6
nnoremap r1 r6
xnoremap r1 r6
nnoremap ,s1 <cmd>HopChar1<CR>6
vnoremap ,s1 <cmd>HopChar1<CR>6
nnoremap dt1 dt6
nnoremap dT1 dT6

inoremap 3 0
cnoremap 3 0
tnoremap 3 0
nnoremap r3 r0
xnoremap r3 r0
nnoremap ,s3 <cmd>HopChar1<CR>0
vnoremap ,s3 <cmd>HopChar1<CR>0
nnoremap dt3 dt0
nnoremap dT3 dT0

inoremap 5 8
cnoremap 5 8
tnoremap 5 8
nnoremap r5 r8
xnoremap r5 r8
nnoremap ,s5 <cmd>HopChar1<CR>8
vnoremap ,s5 <cmd>HopChar1<CR>8
nnoremap dt5 dt8
nnoremap dT5 dT8

inoremap 0 5
cnoremap 0 5
tnoremap 0 5
nnoremap r0 r5
xnoremap r0 r5
nnoremap ,s0 <cmd>HopChar1<CR>5
vnoremap ,s0 <cmd>HopChar1<CR>5
nnoremap dt0 dt5
nnoremap dT0 dT5

inoremap 9 3
cnoremap 9 3
tnoremap 9 3
nnoremap r9 r3
xnoremap r9 r3
nnoremap ,s9 <cmd>HopChar1<CR>3
vnoremap ,s9 <cmd>HopChar1<CR>3
nnoremap dt9 dt3
nnoremap dT9 dT3

inoremap 8 1
cnoremap 8 1
tnoremap 8 1
nnoremap r8 r1
xnoremap r8 r1
nnoremap ,s8 <cmd>HopChar1<CR>1
vnoremap ,s8 <cmd>HopChar1<CR>1
nnoremap dt8 dt1
nnoremap dT8 dT1

map <C-l> %

inoremap 6 9
cnoremap 6 9
tnoremap 6 9
nnoremap r6 r9
xnoremap r6 r9
map ,s6 ,s9
nnoremap ,s6 <cmd>HopChar1<CR>9
vnoremap ,s6 <cmd>HopChar1<CR>9
nnoremap dt6 dt9
nnoremap dT6 dT9
