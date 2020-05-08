NAME = libprintf.a
FLAGS = -Wall -Wextra -Werror -O3
SOURCE = ft_ldiv.c ft_printf.c pf_float.c pf_ftoa.c pf_itoa_base.c pf_dragon4.c\
		pf_parse_ldouble.c pf_printf.c pf_type.c ft_isupper.c ft_fwrite.c\
		pf_putbuf.c pf_float_f.c pf_float_e.c ft_ceil.c pf_round_hex.c\
		ft_isdigit.c ft_memcpy.c ft_strchr.c ft_strlen.c ft_memchr.c pf_wctoa.c\
		pf_bigint_set.c pf_bigint_cmp_cpy_div.c pf_bigint_mul.c pf_bigint_pow.c\
		pf_bigint_shiftl.c pf_parse.c pf_type_num.c pf_type_str.c pf_time.c
HEADER = ft_printf.h libft.h pf_buffer.h pf_design.h pf_dragon4.h pf_errno.h\
		pf_time.h pf_types.h

INCLUDES = -Iincludes 
VPATH = srcs includes

OBJ = $(SOURCE:.c=.o)
OBJ_DIR = obj/
OBJECT = $(patsubst %.o, $(OBJ_DIR)%.o, $(OBJ))

.PHONY : all clean fclean re

all : $(NAME)

$(NAME) : $(OBJECT)
	@echo "\033[1;3;34m"
	ar rc $@ $?
	ranlib $@
	@echo "\033[23;32m--[ "$(NAME) ]-- successfully compiled"\033[0m"

$(OBJ_DIR)%.o : %.c $(HEADER)
	@echo "\033[36;3m\c"
	gcc $(FLAGS) $(INCLUDES) -c $< -o $@
	@echo "\033[0m\c"

clean :
	@find $(OBJ_DIR) -type f -not -name '.gitkeep' -delete

fclean : clean
	@rm -f $(NAME)

re : fclean all
