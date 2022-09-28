NAME = libft.a

SRCS = ${wildcard *.c}

OBJS = ${SRCS:.c=.o}

CC = gcc
RM = rm -f
AR = ar rcs

CFLAGS = -Wall -Werror -Wextra

.c.o:
		${CC} ${CFLAGS} -c $< -o ${<:.c=.o}

${NAME}:	${OBJS}
			${AR} ${NAME} ${OBJS}

all:		${NAME}

clean:
			${RM} ${OBJS}

fclean:		clean
			${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re