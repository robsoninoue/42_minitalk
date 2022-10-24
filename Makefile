# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/20 15:46:14 by rotakesh          #+#    #+#              #
#    Updated: 2022/10/25 00:50:03 by rotakesh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables

NAME =			minitalk

CLIENT_SRCS =	client.c
SERVER_SRCS =	server.c

CLIENT_NAME =	client
SERVER_NAME =	server

CLIENT_SRC_DIR =	src_client
SERVER_SRC_DIR =	src_server

CLIENT_OBJS =	${CLIENT_SRCS:%.c=${OBJ_DIR}/%.o}
SERVER_OBJS =	${SERVER_SRCS:%.c=${OBJ_DIR}/%.o}

CLIENT_OBJ_DIR =	obj_client
SERVER_OBJ_DIR =	obj_server

OBJ_DIR =			obj
SRC_DIR =		src
CC =			gcc
RM =			rm -rf
CFLAGS =		-Wall -Werror -Wextra
LIB =			-Llibft -lft
INC =			-Ilibft

# Rules

${NAME}:		${OBJ_DIR} libft server client

${OBJ_DIR}:
				mkdir -p ${OBJ_DIR}

${OBJ_DIR}/%.o:	${SRC_DIR}/%.c
				${CC} ${CFLAGS} ${INC} -c $< -o $@

all:			${NAME}

client:			${CLIENT_OBJS}
				${CC} -o $@ ${OBJ_DIR}/${CLIENT_NAME}.o ${INC} ${LIB}
				@echo "Client created"

server:			${SERVER_OBJS}
				${CC} -o $@ ${OBJ_DIR}/${SERVER_NAME}.o ${INC} ${LIB}
				@echo "Server created"

libft:
				@make -C libft

clean:
				@${RM} ${OBJ_DIR}
				@make -C libft clean
				@echo "Objects removed"

fclean:			clean
				@${RM} ${CLIENT_NAME}
				@${RM} ${SERVER_NAME}
				@make -C libft fclean
				@echo "Client and Server removed"

re:				fclean all

.PHONY:			all clean fclean re libft