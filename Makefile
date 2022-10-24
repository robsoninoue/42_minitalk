# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/20 15:46:14 by rotakesh          #+#    #+#              #
#    Updated: 2022/10/25 01:32:17 by rotakesh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables

NAME =				minitalk

CLIENT_SRCS =		client.c
SERVER_SRCS =		server.c

CLIENT_BONUS_SRCS =	client_bonus.c
SERVER_BONUS_SRCS =	server_bonus.c

CLIENT_NAME =		client
SERVER_NAME =		server

CLIENT_OBJS =		${CLIENT_SRCS:%.c=${OBJ_DIR}/%.o}
SERVER_OBJS =		${SERVER_SRCS:%.c=${OBJ_DIR}/%.o}

CLIENT_BONUS_OBJS =	${CLIENT_BONUS_SRCS:%.c=${OBJ_DIR}/%.o}
SERVER_BONUS_OBJS =	${SERVER_BONUS_SRCS:%.c=${OBJ_DIR}/%.o}

OBJ_DIR =			obj
SRC_DIR =			src
BONUS_DIR =			bonus
CC =				gcc
RM =				rm -rf
CFLAGS =			-Wall -Werror -Wextra
LIB =				-Llibft -lft
INC =				-Ilibft

# Rules

${NAME}:			${OBJ_DIR} libft server client

${OBJ_DIR}:
					@mkdir -p ${OBJ_DIR}

${OBJ_DIR}/%.o:		${SRC_DIR}/%.c
					@${CC} ${CFLAGS} ${INC} -c $< -o $@

${OBJ_DIR}/%.o:		${BONUS_DIR}/%.c
					@${CC} ${CFLAGS} ${INC} -c $< -o $@

all:				${NAME}

bonus:				fclean ${OBJ_DIR} libft server_bonus client_bonus

client:				${CLIENT_OBJS}
					@${CC} -o $@ $< ${INC} ${LIB}
					@echo "Client created"

server:				${SERVER_OBJS}
					@${CC} -o $@ $< ${INC} ${LIB}
					@echo "Server created"

client_bonus:		${CLIENT_BONUS_OBJS}
					@${CC} -o ${CLIENT_NAME} $< ${INC} ${LIB}
					@echo "Client bonus created"

server_bonus:		${SERVER_BONUS_OBJS}
					@${CC} -o ${SERVER_NAME} $< ${INC} ${LIB}
					@echo "Server bonus created"

libft:
					@make -s -C libft

clean:
					@${RM} ${OBJ_DIR}
					@make -s -C libft clean
					@echo "Objects removed"

fclean:				clean
					@${RM} ${CLIENT_NAME}
					@${RM} ${SERVER_NAME}
					@make -s -C libft fclean
					@echo "Client and Server removed"

re:					fclean all

.PHONY:				all clean fclean re libft bonus